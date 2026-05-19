
# AI_RISCV

## Schritt 1: Projektstruktur

Am Anfang lohnt sich ein kurzer Blick auf die Projektstruktur. Die wichtigsten Ordner in diesem Repository sind:
- `Literatur`: Dieser Ordner enthaelt Unterlagen und Daten zur Einarbeitung.
- `training`: Hier befinden sich die Skripte zum Erstellen und Trainieren des Modells.
- `hw/ai_acc`: Hier befindet sich der RTL-Code des implementierten KI-Beschleunigers.
- `hw/synthesis`: Hier liegen die fuer die Synthese benoetigten Skripte.


Mit diesen vier Bereichen beginnt im Grunde die gesamte Arbeit im Projekt.

## Schritt 2: Literatur

Als naechstes bietet es sich an, den Ordner `Literatur` durchzugehen. Dort liegen die fachlichen und methodischen Grundlagen der Masterarbeit sowie Material zur technischen Einarbeitung.

Ein zentraler Bestandteil ist das MobileNet-Paper. Dort werden die Grundideen von MobileNet beschrieben, insbesondere die Verwendung von Depthwise- und Pointwise-Convolution. Das ist wichtig, um die spaetere Netzwerkstruktur, die Datenfluesse und die Anforderungen an die Hardware besser einordnen zu koennen.

Zusaetzlich befindet sich in diesem Ordner der Bericht zur Masterarbeit. Er beschreibt den Kontext der Arbeit, die Ziele, den Aufbau des Beschleunigers, die gewaehlte Vorgehensweise und die wichtigsten Ergebnisse. Damit ist er eine gute Orientierung fuer das Gesamtprojekt.

Ausserdem liegen in `Literatur` weitere wissenschaftliche Quellen, zum Beispiel eine zweite Masterarneit basierend auf systolic Array, die mir geholfen hat, bei dem Verständnis.

Ein weiterer wichtiger Teil ist die SystemVerilog-Einarbeitung. Im Unterordner `Literatur/system_verilog_lernen` liegen sowohl PDF-Unterlagen als auch praktische Beispiele. Dort findet man Einfuehrungsmaterial, kleine Uebungen und Beispielmodule wie Addierer, Multiplexer, Shift-Register, endliche Automaten und erste Hardwarebeispiele. Diese Materialien erleichtern den Einstieg in SystemVerilog und in den Hardwareentwurf.

## Schritt 3: Training und Modellerstellung

Der Ordner `training` bildet die Grundlage fuer alles, was vor der Hardwareumsetzung passiert. Hier liegen die Datenbasis, die Trainingsskripte, die Evaluationswerkzeuge und die erzeugten Modellartefakte fuer das verwendete MobileNet-basierte Klassifikationsmodell.

Im Unterordner `training/Daten` liegen die gespeicherten EuroSAT-Daten sowie exportierte Bilddateien, die spaeter fuer Training, Evaluation und Vorhersage verwendet werden. Der Unterordner `training/scripts` enthaelt die eigentlichen Python-Skripte fuer den Trainingsablauf.

`train.py` ist das zentrale Trainingsskript. In der Regel wird zuerst ein Warm-up mit eingefrorenem Backbone und anschliessend ein Fine-Tuning mit trainierbarem Backbone durchgefuehrt. Dabei werden Parameter wie Bildgroesse, Batchgroesse, Anzahl der Epochen und Ausgabepfad fuer das Modell gesetzt.

Aufruf:

```bash
python training/scripts/train.py --data-dir training/Daten --img-size 224 --batch-size 64 --epochs 12 --finetune-epochs 5 --model-out training/scripts/Model/MobileNetV1_EuroSAT.keras
```

`model.py` ist ein Hilfsmodul fuer die Modellarchitektur. Es wird normalerweise nicht direkt ueber die Kommandozeile gestartet, sondern von anderen Skripten importiert. Dort wird das MobileNetV1-Modell mit dem Klassifikationskopf definiert.

Verwendung im Code:

```python
from model import build_mobilenet_v1
```

Das Skript `data.py` ist ebenfalls ein Hilfsmodul. Es laedt den Datensatz, fuehrt die Vorverarbeitung fuer MobileNet durch, erzeugt Trainings- und Validierungsdaten und schreibt Label-Zuordnungen. Auch dieses Skript wird normalerweise importiert und nicht direkt als eigenstaendiges Kommando ausgefuehrt.

Verwendung im Code:

```python
from data import make_datasets
```

`predict.py` wird fuer Vorhersagen mit dem trainierten Keras-Modell verwendet. Es laedt ein Bild, fuehrt die passende Vorverarbeitung durch und gibt die wahrscheinlichsten Klassen aus.

Aufruf:

```bash
python training/scripts/predict.py --model-path training/scripts/Model/MobileNetV1_EuroSAT.keras --image <pfad_zum_bild> --img-size 224 --topk 3
```

`evaluate.py` bewertet ein trainiertes Keras-Modell auf dem Validierungsdatensatz. Damit laesst sich die Genauigkeit des Modells pruefen, bei Bedarf auch mit weiteren Metriken wie Top-5-Accuracy.

Aufruf:

```bash
python training/scripts/evaluate.py --model-path training/scripts/Model/MobileNetV1_EuroSAT.keras --img-size 224 --batch-size 64 --data-dir training/Daten --with-top5
```

`predict_tflite.py` fuehrt Vorhersagen mit einem quantisierten TFLite-Modell aus. Das ist vor allem dann nuetzlich, wenn geprueft werden soll, wie sich ein exportiertes oder quantisiertes Modell bei realen Eingabebildern verhaelt.

Aufruf:

```bash
python training/scripts/predict_tflite.py --model <pfad_zur_tflite_datei> --image <pfad_zum_bild> --img-size 128 --map-labels training/scripts/map_labels.json --topk 5
```

`quant_eval.py` vergleicht verschiedene Quantisierungsvarianten, zum Beispiel `fp32`, `dynamic int8`, `full int8`, `int16x8` oder `float16`. So laesst sich abschaetzen, welche Genauigkeit und welche Modellgroesse mit den verschiedenen Varianten erreicht werden.

Aufruf:

```bash
python training/scripts/quant_eval.py --model-path training/scripts/Model/MobileNetV1_EuroSAT.keras --data-dir training/Daten --img-size 224 --batch-size 64
```


`export_eurosat_images.py` exportiert EuroSAT-Bilder aus dem Datensatz in eine Verzeichnisstruktur mit Klassenordnern. Das ist hilfreich, wenn die Bilder direkt im Dateisystem fuer Vorhersagen, Sichtpruefungen oder andere Werkzeuge benoetigt werden.

Aufruf:

```bash
python training/scripts/export_eurosat_images.py --data-dir training/Daten --out-dir training/Daten/eurosat_images --split train
```

`main_model_inspect.py` dient zur Inspektion des trainierten Modells. Es kann Layerinformationen, Gewichtsstatistiken und optional Aktivierungsstatistiken ausgeben. Damit eignet es sich gut fuer die Analyse des Netzes vor dem Export oder vor einer Anpassung an die Hardware.

Aufruf:

```bash
python training/scripts/main_model_inspect.py --model-path training/scripts/Model/MobileNetV1_EuroSAT.keras --with-activations --batches 2 --batch-size 64 --img-size 224 --data-dir training/Daten
```

Insgesamt bildet der Ordner `training` die Grundlage fuer das Erstellen, Testen, Bewerten und Quantisieren des Modells, das spaeter fuer die Hardwareumsetzung und Validierung verwendet wird.

## Schritt 4: RTL-Struktur des KI-Beschleunigers

Nach dem Training lohnt sich der Blick auf den RTL-Aufbau des Beschleunigers im Ordner `hw/ai_acc`. Die Implementierung ist in mehrere Funktionsbloecke unterteilt, die gemeinsam die Datenaufnahme, die Berechnung, die Aktivierung, das Pooling und die Anbindung an das Gesamtsystem uebernehmen.

Der Ordner `hw/ai_acc/acitvation module` enthaelt die ReLU-Logik. Dort befinden sich Module wie `ReLU_module.sv` und `ReLU_unit.sv`. Diese Module wenden die Aktivierungsfunktion auf die berechneten Ausgabewerte an. In der Array-Variante wird die ReLU-Funktion parallel auf mehrere Elemente einer Tile-Struktur angewendet und mit Valid-Signalen sowie einem Done-Signal verbunden.

Der Ordner `hw/ai_acc/arithmetic module` bildet den arithmetischen Kern des Beschleunigers. Dort befinden sich unter anderem `arithmetic_module.sv`, `conv_depth_module.sv`, `process_element_module.sv` sowie ein eigener Controller im Unterordner `arithmetic_controller`. Dieser Bereich ist fuer die eigentliche Faltung, Depthwise- und Pointwise-Berechnung, die Bias- und Requantisierungsverarbeitung sowie die Steuerung der Rechenpipeline verantwortlich. Hier liegt damit der eigentliche Rechenkern des KI-Beschleunigers.

Im Ordner `hw/ai_acc/axi module` befindet sich die AXI-Anbindung. Das Modul `axi_module.sv` verbindet den Beschleuniger mit der Aussenwelt. Es stellt einerseits eine AXI-Lite-Schnittstelle fuer Konfiguration und Steuerregister bereit und uebernimmt andererseits ueber AXI-Master-Zugriffe den Datentransfer fuer Eingaben, Gewichte, Bias, Shift- und Multiplier-Daten in die internen Speicher des Beschleunigers.

Der Ordner `hw/ai_acc/pooling_module` enthaelt die Pooling-Logik. Dazu gehoeren `pooling_module.sv`, `pooling_unit.sv` und ein Testbench-Modul. Dieser Block verarbeitet Zwischenergebnisse der Faltung weiter und fuehrt Max-Pooling oder Average-Pooling aus, je nach Konfiguration. Damit wird die Reduktion der Feature-Maps nach den Convolution-Schritten hardwareseitig umgesetzt.

Im Ordner `hw/ai_acc/processing_module` liegt die uebergeordnete Verarbeitungslogik. Dazu gehoeren unter anderem `processing_module.sv`, `fetching_module.sv`, Speicher- und Buffer-Strukturen sowie weitere Unterordner fuer Bias/Shift, Gewichte, Ein- und Ausgabe und Line-Buffer. Dieser Bereich organisiert den Datenfluss innerhalb des Beschleunigers. Dazu zaehlen das Laden der Aktivierungen und Gewichte aus den Speichern, die Verwaltung von Laufzeitkonfigurationen, das Zusammenspiel mit Ping-Pong-Speicherbereichen und die Weitergabe der Daten an die arithmetischen Einheiten.

Der Ordner `hw/ai_acc/top_module` enthaelt mit `top_module.sv` die oberste Integrationsebene des Beschleunigers. In diesem Modul werden die grossen Hauptbloecke wie AXI-Modul, Verarbeitungslogik und Steuerung miteinander verschaltet. Das Top-Modul bildet damit die Hauptschnittstelle des gesamten KI-Beschleunigers nach aussen.

Der Ordner `hw/ai_acc/testbench` dient der Verifikation der Hardware. Dort befindet sich die zentrale Testbench `testbench.sv` sowie ein eigener `rom`-Ordner fuer die genutzten ROM-Dateien. In der Testbench werden Takt, Reset, Konfigurationswerte, Eingabedaten und Speicherinhalte bereitgestellt, damit das Verhalten des Beschleunigers simuliert und validiert werden kann. Damit gehoert dieser Ordner nicht direkt zur RTL-Funktion des Beschleunigers selbst, ist aber entscheidend fuer Simulation, Debugging und funktionale Absicherung.

Durch diese Aufteilung in Aktivierung, Arithmetik, AXI-Anbindung, Pooling, Verarbeitungslogik, Top-Level und Testbench ist der Beschleuniger modular aufgebaut. Das erleichtert sowohl das Verstaendnis des Designs als auch die spaetere Validierung, Erweiterung und Synthese.

Zum vierten Schritt gehoert auch der Ordner `hw/ai_acc/python`. Dort liegen Python-Skripte, die den Hardwareentwurf unterstuetzen. Diese Skripte dienen nicht der RTL-Implementierung selbst, sondern helfen bei ROM-Erzeugung, Referenzberechnung und Validierung der Hardwareergebnisse.

Das Skript `layout.py` liest die `params.h`-Dateien unter `hw/ai_acc/Modell for Evaluation/Layer Daten` ein. Daraus extrahiert es Gewichte, Bias, Output-Shift und Output-Multiplier und schreibt die Dateien `rom_weights_all.bin`, `rom_bias_all.bin`, `rom_shift_all.bin` und `rom_mult_all.bin`. Dabei bringt es die Gewichte in das fuer die Hardware benoetigte Layout. Conv- und Pointwise-Gewichte werden in das Layout `[cin][kh][kw][cout]` umgeordnet, waehrend Depthwise-Gewichte als `[y][x][c]` abgelegt werden.

Aufruf:

```bash
python hw/ai_acc/python/layout.py
```

Das Skript `validate_avgpool.py` dient zur Validierung des Average-Pooling-Verhaltens. Es laedt ein vorbereitetes Eingabebild, rekonstruiert die Gewichte aus einem Hardwarelayout, berechnet zuerst die Convolution in Software, fuehrt danach ein 2x2-Average-Pooling mit Stride 2 aus und vergleicht das Ergebnis mit einer von der Hardware erzeugten Feature-Map. Es ist damit vor allem ein gezieltes Debugging- und Vergleichsskript fuer den Pooling-Pfad.

Aufruf:

```bash
python hw/ai_acc/python/validate_avgpool.py
```

Das Skript `validate_maxpool.py` arbeitet aehnlich, ist aber auf Max-Pooling ausgelegt. Es berechnet zunaechst die Convolution in Software, fuehrt anschliessend ein 2x2-Max-Pooling aus und vergleicht die Softwareausgabe mit einer Hardwaredatei. Damit kann geprueft werden, ob der Max-Pooling-Block des Beschleunigers korrekt arbeitet.

Aufruf:

```bash
python hw/ai_acc/python/validate_maxpool.py
```

Das Skript `validate_hw_pipeline.py` ist das umfassendste Validierungsskript in diesem Ordner. Es bildet die Hardwarepipeline der Convolution-, Depthwise- und Pointwise-Layer in Software nach und nutzt dazu die ROM-Dateien sowie ein Eingabebild. Danach vergleicht es die berechneten Software-Ausgaben mit den in der Hardware erzeugten Dump-Dateien. Dieses Skript ist besonders wichtig fuer die schrittweise Verifikation einzelner Layer oder auch groesserer Teile des Netzes. Zusaetzlich lassen sich Pfade fuer Eingabebild, ROM-Dateien, Ausgabeordner und Zusammenfassungsdatei ueber Kommandozeilenargumente anpassen.

Aufruf:

```bash
python hw/ai_acc/python/validate_hw_pipeline.py --start-layer 1 --end-layer 3
```

oder

```bash
python hw/ai_acc/python/validate_hw_pipeline.py --layers 1,2,3
```

Zum vierten Schritt gehoert auch der Ordner `hw/ai_acc/evaluation`. Dieser Ordner dient vor allem der Auswertung und Dokumentation der Validierungsergebnisse. Dort befinden sich Unterordner wie `bericht` und `bericht_sw`, in denen Hardware-Dumps, Software-Referenzdateien und Vergleichsergebnisse abgelegt werden. Ausserdem liegen dort Report-Dateien wie `rom_build_full_model_report_cxyk.txt` und `rom_build_full_model_report_cyxk.txt`, die Informationen ueber die aufgebauten ROM-Dateien, Offsets, Bytegroessen und Layoutvarianten enthalten. Der Ordner `evaluation` ist damit die zentrale Stelle fuer Analyse, Vergleich und Dokumentation der Hardwareausgaben.

Der Ordner `hw/ai_acc/Modell for Evaluation` ist die Verbindung zwischen dem trainierten Modell und der Hardwarevalidierung. Dort liegen das quantisierte TFLite-Modell, Eingabedaten, exportierte Layerdaten, Hilfsdateien sowie mehrere Python-Skripte zur Vorbereitung und zum Vergleich von Referenzdaten. Dieser Bereich wird verwendet, um Modellparameter, Eingaben und erwartete Ausgaben in eine Form zu bringen, die fuer Simulation und Hardwarevergleich geeignet ist.

Das Skript `export_tflite_layers.py` exportiert Gewichte, Bias, Quantisierungsparameter und optional auch erwartete Layerausgaben direkt aus einem quantisierten TFLite-Modell. Es erzeugt daraus pro Layer Dateien, die spaeter fuer Referenzrechnungen, Header-Erzeugung oder Hardwarevergleiche verwendet werden koennen. Falls auch erwartete Layerausgaben exportiert werden sollen, kann man zusaetzlich `--dump-outputs` und zum Beispiel `--image <bilddatei>` verwenden.

Aufruf:

```bash
python hw/ai_acc/Modell for Evaluation/export_tflite_layers.py --model hw/ai_acc/Modell for Evaluation/1-MobileNetV1-128_int8.tflite --out-dir hw/ai_acc/Modell for Evaluation/exports
```

Das Skript `generate_image_array.py` wandelt ein Eingabebild in einen modellgerechten Eingabetensor um. Dabei kann es Form, Datentyp und Quantisierung direkt aus einer TFLite-Datei ableiten oder ueber Parameter erhalten. Das Skript kann die Ausgabe als NumPy-Datei, Textdatei oder C-Array erzeugen und ist damit nuetzlich, wenn Eingabedaten fuer Software, Testbench oder Bare-Metal-Code vorbereitet werden sollen.

Aufruf:

```bash
python hw/ai_acc/Modell for Evaluation/generate_image_array.py --image hw/ai_acc/Modell for Evaluation/image.png --model hw/ai_acc/Modell for Evaluation/1-MobileNetV1-128_int8.tflite --out-dir hw/ai_acc/Modell for Evaluation/exports/input_dump
```

Das Skript `compare_channel_outputs.py` vergleicht kanalweise int8-Ausgaben zwischen einer Simulation oder einer Hardware-Binärdatei und einer Referenzdatei aus dem Exportprozess. Damit kann man gezielt untersuchen, ob eine bestimmte Layerausgabe pro Kanal mit der Referenz uebereinstimmt. Alternativ kann statt `--sim-bin` auch ein Simulationslog verwendet werden.

Aufruf:

```bash
python hw/ai_acc/Modell for Evaluation/compare_channel_outputs.py --sim-bin hw/ai_acc/evaluation/bericht/layer_1_ofmap_64x64x32_hwc.bin --ref-txt hw/ai_acc/Modell for Evaluation/exports/.../output.txt
```

## Schritt 5: Synthese

Der Ordner `hw/synthesis` enthaelt die Infrastruktur fuer die Synthese der verschiedenen Designs. Dort liegen nicht nur Bibliotheken und allgemeine Skripte, sondern auch mehrere vorbereitete Core-Verzeichnisse, in denen konkrete Syntheseläufe und Ergebnisse organisiert sind.

In `hw/synthesis` befindet sich bereits eine eigene README-Datei befindet: `hw/synthesis/README.md`. Diese README erklaert den Syntheseordner im Detail. Dort ist beschrieben, wie ein neuer Core angelegt wird, welche Verzeichnisstruktur erwartet wird, wie `read_design.tcl` aufgebaut sein muss und wie ein Syntheselauf gestartet wird. Ausserdem gibt es dort Hinweise zur Dateireihenfolge beim Einlesen von RTL, zu optionaler RTL-Architect-Unterstuetzung und zum Aufruf von Design Compiler.

Unter folgenden Commands kannst du die Synthese durchführen:

```bash
module load synopsys_design_compiler/W-2024.09-SP1
DESIGN_NAME=ki_beschleuniger dcnxt_shell -topo -f /home/abedM/ai_riscv/hw/synthesis/scripts/run.tcl
```

Bitte beachte, dass der Pfad angepasst werden muss, je nach deiner lokalen Umgebung und Verzeichnisstruktur.

## Schritt 6: Optimierungen

Für das Verständnis einzelner Module kann man sich das Verhalten eines Moduls beispielsweise in ModelSim mithilfe der Testbench ansehen. Wenn man genauer verstehen möchte, wie ein Modul arbeitet, ist eine dedizierte Testbench für dieses Modul empfehlenswert. Dabei kann man kleine Unit-Tests definieren. Ich habe viele Testbenches implementiert, die in früheren Commits zu finden sind. Für die Einfachheit und Übersichtlichkeit meines Repositories habe ich jedoch nur die globale Testbench beibehalten.

Nachdem man verstanden hat, wie der KI-Beschleuniger arbeitet, sollte grundsätzlich daran gearbeitet werden, seine Flexibilität zu erhöhen:

- Man kann zum Beispiel einen N×N-Line-Buffer bzw. Fenstergenerator implementieren, um weitere Fenstergrößen zu unterstützen.
- Für die Datenbereitstellung können auch andere Lösungsansätze integriert und getestet werden. In der Literatur findet man beispielsweise ein On-the-fly-Prinzip, bei dem Pixel direkt bereitgestellt werden, anstatt Window-RAMs und Line-Buffer zu verwenden.
- Es sollte auch an einer Maskierung beim Fetching aus den SRAMs gearbeitet werden, sodass sich beliebige Tiling-Konfigurationen für das Systolic Array definieren lassen.
- Um weitere Convolution-Operationen zu unterstützen, sollte ein Partialsummen-Controller sowie ein Partialsummen-Manager integriert werden.
- Die Details dazu habe ich in meinem Masterarbeitsbericht beschrieben.
























































































































