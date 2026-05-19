#!/usr/bin/env python3
import numpy as np

   
# Parameter (müssen zu deinem RTL passen)
   
IMG_W = 224          # Original Bildgröße
IMG_H = 224
PAD_W = IMG_W + 2    # 226
PAD_H = IMG_H + 2
CH    = 3
K     = 3
STRIDE = 2
CO     = 32          # Anzahl Output-Filter

FM_H = ((PAD_H - K) // STRIDE) + 1   # 112
FM_W = ((PAD_W - K) // STRIDE) + 1   # 112

# Pooling 2x2, Stride 2
POOL_K      = 2
POOL_STRIDE = 2
POOL_H      = FM_H // POOL_STRIDE    # 56
POOL_W      = FM_W // POOL_STRIDE    # 56

   
# Dateien
   
PATH_X_PAD = r"C:\Users\amora\Desktop\Neuer Ordner (2)\ai_riscv\hw\ai_acc\processing_module\line buffer\x_i8_int8_pot_sauria_same_pad.bin"

# SAURIA-Layout-Weights (mit make_weights_sauria_mem.py erzeugt)
PATH_W_SAURIA = r"C:\Users\amora\Desktop\Neuer Ordner (2)\ai_riscv\hw\ai_acc\processing_module\weight\weights_int8_sauria.bin"

# Bias & Requant-Shift (32 x int32)
PATH_BIAS  = r"C:\Users\amora\Desktop\Neuer Ordner (2)\ai_riscv\hw\ai_acc\layers\first_layer\bias_hw_int32.bin"
PATH_SHIFT = r"C:\Users\amora\Desktop\Neuer Ordner (2)\ai_riscv\hw\ai_acc\layers\first_layer\requant_shift_int32.bin"

# HW-Featuremap nach Average-Pooling (neue Datei!)
PATH_HW_FM = r"C:\Users\amora\Desktop\Neuer Ordner (2)\ai_riscv\hw\ai_acc\tb\layer0_pool_ofmap_hwc.bin"

   
# Helper: Saturation & Requant wie im process_element_module
   
def saturate_int32(val: int) -> int:
    """Clamp auf signed 32-bit Range."""
    if val >  0x7FFFFFFF:
        return  0x7FFFFFFF
    if val < -0x80000000:
        return -0x80000000
    return val

def saturate_int8(val: int) -> np.int8:
    """Clamp auf signed int8 [-128..127]."""
    if val > 127:
        val = 127
    if val < -128:
        val = -128
    return np.int8(val)

def requant_and_saturate(acc32: int, shift: int) -> np.int8:
    """
    Entspricht der Requant-Logik im process_element_module:
      - acc32: 32-bit signed Akkumulator nach MAC + Bias (bereits saturate_int32)
      - shift: i_requant_shift (wir klemmen auf [0,32])
      - Round-to-nearest, dann arithmetischer Shift, dann Sat8
    """
    # Clamp Shift auf [0,32] (ACC_W-1)
    if shift < 0:
        shift_amt = 0
    elif shift > 32:
        shift_amt = 32
    else:
        shift_amt = int(shift)

    acc = int(acc32)

    if shift_amt == 0:
        acc_shifted = acc
    else:
        # round_bias wie im RTL:
        #  round_bias[shift_amt-1] = 1
        #  bei negativen Werten: -1 zusätzlich
        if acc >= 0:
            round_bias = 1 << (shift_amt - 1)
        else:
            round_bias = (1 << (shift_amt - 1)) - 1
        acc_round = acc + round_bias
        # arithmetischer Shift (Python >> ist arithmetisch für ints)
        acc_shifted = acc_round >> shift_amt

    # Finale Sat8
    return saturate_int8(acc_shifted)


   
# 1) Eingabebild laden (gepadet, HWC, int8)
   
x_flat = np.fromfile(PATH_X_PAD, dtype=np.int8)
expected_elems = PAD_W * PAD_H * CH
assert x_flat.size == expected_elems, f"Pad-Input: {x_flat.size} != {expected_elems}"

# Layout: (H, W, C) = (226, 226, 3)
x = x_flat.reshape(PAD_H, PAD_W, CH)  # HWC, int8
print("Input (HW & SW) geladen. Shape:", x.shape)

   
# 2) Weights aus SAURIA-Layout -> zurück nach [CO, CH, K, K]
   
C = CH
H = K
W = K

w_sauria = np.fromfile(PATH_W_SAURIA, dtype=np.int8)
expected_w = CO * C * H * W
assert w_sauria.size == expected_w, f"Weights: {w_sauria.size} != {expected_w}"

w_arr = np.zeros((CO, C, H, W), dtype=np.int8)

idx = 0
for c in range(C):
    for h in range(H):
        for w_ in range(W):
            for k in range(CO):
                w_arr[k, c, h, w_] = w_sauria[idx]
                idx += 1

print("Weights (SAURIA -> [CO,CH,K,K]) rekonstruiert. Shape:", w_arr.shape)

   
# 3) Bias & Requant-Shift laden (je 32 x int32)
   
bias_arr = np.fromfile(PATH_BIAS, dtype=np.int32)
shift_arr = np.fromfile(PATH_SHIFT, dtype=np.int32)

assert bias_arr.size == CO,  f"Bias: {bias_arr.size} != {CO}"
assert shift_arr.size == CO, f"Shift: {shift_arr.size} != {CO}"

print("Bias geladen. Shape:", bias_arr.shape)
print("Requant-Shift geladen. Shape:", shift_arr.shape)

   
# 4) Convolution in Software mit Bias + Requant-Shift
#
#   acc = saturate32( bias[k] + Sum( x * w ) )
#   dann requant_and_saturate(acc, shift[k]) -> int8
   
y_conv = np.zeros((FM_H, FM_W, CO), dtype=np.int8)

for oy in range(FM_H):
    for ox in range(FM_W):
        in_y = oy * STRIDE
        in_x = ox * STRIDE

        # Patch (K,K,C) -> (C,K,K), damit es zu [C,H,W] passt
        patch = x[in_y:in_y+K, in_x:in_x+K, :]      # (K, K, C)
        patch_chw = np.transpose(patch, (2, 0, 1))  # (C, K, K)
        patch_i32 = patch_chw.astype(np.int32)

        for k in range(CO):
            w_k_i32 = w_arr[k].astype(np.int32)   # (C, K, K)

            # MAC mit saturate_int32 pro Summe (nahe am RTL-Verhalten)
            acc = int(bias_arr[k])
            # 3*3*3 = 27 Elemente
            for c in range(C):
                for kh in range(K):
                    for kw in range(K):
                        prod = int(patch_i32[c, kh, kw]) * int(w_k_i32[c, kh, kw])
                        acc = saturate_int32(acc + prod)

            # Requant + Sat8 wie im PE
            shift_k = int(shift_arr[k])
            y_conv[oy, ox, k] = requant_and_saturate(acc, shift_k)

print("Software-Conv mit Bias+Requant fertig. Shape:", y_conv.shape)

   
# 5) 2x2 Max-Pooling mit Stride 2 (HW-Verhalten nachbauen)
   
y_sw = np.zeros((POOL_H, POOL_W, CO), dtype=np.int8)

for oy in range(POOL_H):
    for ox in range(POOL_W):
        in_y = oy * POOL_STRIDE
        in_x = ox * POOL_STRIDE

        # 2x2-Fenster aus der Conv-Featuremap
        # Shape: (2,2,CO)
        window = y_conv[in_y:in_y+POOL_K, in_x:in_x+POOL_K, :]
        # Max über (2x2) pro Kanal
        # axis=(0,1) -> über y und x
        y_sw[oy, ox, :] = window.max(axis=(0, 1))

print("Software-Maxpool fertig. Shape:", y_sw.shape)

   
# 6) HW-Featuremap laden (56x56x32, HWC row-major)
   
fm_hw_flat = np.fromfile(PATH_HW_FM, dtype=np.int8)
expected_fm = POOL_H * POOL_W * CO
assert fm_hw_flat.size == expected_fm, f"HW FM: {fm_hw_flat.size} != {expected_fm}"

y_hw = fm_hw_flat.reshape(POOL_H, POOL_W, CO)  # (56,56,32), HWC
print("HW-Featuremap (Maxpool) geladen. Shape:", y_hw.shape)

   
# 7) Vergleich SW vs HW
   
diff = y_hw.astype(np.int16) - y_sw.astype(np.int16)
abs_diff = np.abs(diff)

max_abs = abs_diff.max()
num_mismatch = np.count_nonzero(abs_diff)
total = POOL_H * POOL_W * CO
mismatch_rate = 100.0 * num_mismatch / total

print("------------------------------------------------")
print("Max |HW - SW|:", int(max_abs))
print(f"Anzahl unterschiedlicher Pixel: {int(num_mismatch)} von {total}")
print(f"Mismatch-Rate: {mismatch_rate:.4f}%")

if num_mismatch > 0:
    idx = np.argwhere(abs_diff > 0)
    print("Beispiel-Mismatches (bis zu 10):")
    for i in range(min(10, idx.shape[0])):
        oy, ox, k = idx[i]
        print(
            f"  (y={oy}, x={ox}, co={k}): "
            f"HW={int(y_hw[oy,ox,k])}, SW={int(y_sw[oy,ox,k])}, "
            f"Δ={int(diff[oy,ox,k])}"
        )
else:
    print("Perfekt: HW und SW (mit Maxpool) sind bitgenau identisch!")
