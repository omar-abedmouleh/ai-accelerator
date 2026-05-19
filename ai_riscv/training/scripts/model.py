"""
MobileNetV1-Backbone für EuroSAT.
Kopf: GlobalAveragePooling -> (optional Dropout) -> Dense(num_classes, softmax)
"""

from __future__ import annotations
import tensorflow as tf

def build_mobilenet_v1(
    num_classes: int,          # Anzahl der EuroSAT-Klassen (10)
    img_size: int = 224,       # Bildauflösung (üblich: 224, 192, 160, 128)
    alpha: float = 1.0,        # Breiten-Multiplikator (0.35..1.0+): <1.0 = schmaler/schneller
    base_trainable: bool = False,  # False = Feature-Extraktor einfrieren (Warm-up)
    dropout: float = 0.0,          # z.B. 0.2 um Overfitting zu reduzieren
) -> tf.keras.Model:
    # Eingabeform: HxWxC (RGB)
    input_shape = (img_size, img_size, 3)

    # MobileNetV1-Backbone ohne Top-Kopf (include_top=False), vortrainiert auf ImageNet
    # -> nutzt generalisierte Features und beschleunigt das Training deutlich.
    base = tf.keras.applications.MobileNet(
        input_shape=input_shape,
        alpha=alpha,          # skaliert die Kanalbreite aller Convs
        include_top=False,    # nur Feature-Extraktor, KEIN klassifizierender Kopf
        weights="imagenet",   # vortrainierte Gewichte laden (RGB, [-1,1] Preprocessing)
    )

    # Warm-up/Fine-Tuning: zunächst einfrieren (False),
    # später für Feinschliff auf EuroSAT-Klassen öffnen (True).
    base.trainable = base_trainable

    # Kopf auf EuroSAT:
    # - GAP reduziert räumliche Dimensionen -> Feature-Vektor
    x = tf.keras.layers.GlobalAveragePooling2D(name="gap")(base.output)

    # - optional Dropout (nur wenn dropout > 0) gegen Overfitting 
    #Dropout: In each forward pass, randomly set some neurons to Zero
    #Force the model to not rely on only a certain set of features
    if dropout and dropout > 0:
        x = tf.keras.layers.Dropout(dropout, name="dropout")(x)

    # - finale Klassifikation auf num_classes (Softmax gibt Klassenwahrscheinlichkeiten)
    out = tf.keras.layers.Dense(num_classes, activation="softmax", name="pred")(x)

    # Vollständiges Modell (Eingabe vom Backbone, Ausgabe vom Kopf)
    model = tf.keras.Model(inputs=base.input, outputs=out, name="mobilenet_v1_eurosat")
    return model
