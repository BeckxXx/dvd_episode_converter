# dvd_episode_converter
Dieses Skript durchsucht einen von dir angegebenen Ordner nach MKV-Dateien, die größer als 1 GB sind und behandelt jede als einzelne Episode. Die Episoden werden ohne Qualitätsverlust verlustfrei in MP4-Dateien umgewandelt und im Unterordner converted abgelegt. Die Dateinamen folgen einem Schema mit dem Ordnernamen und fortlaufender Episodennummer.

---

## Voraussetzungen

* ffmpeg und ffprobe müssen installiert sein und in der System-PATH-Variable gesetzt sein.
  Download -> <https://github.com/BtbN/FFmpeg-Builds/releases>
* Windows PowerShell zur Ausführung des Skripts.


---

## Funktionsweise

* Abfrage des Ordners mit MKV-Dateien
* Abfrage der Start-Episodennummer
* Suche aller MKV-Dateien größer als 1 GB im Ordner
* Erstellung eines Unterordners `converted` (falls nicht vorhanden)
* Konvertierung und Speicherung jeder MKV als MP4 im `converted`-Ordner
* Benennung der Ausgabedateien nach `[Ordnername].E[Nummer].mp4`


---

## Nutzung

1. Speichere das Skript in einer Datei, z.B. `convert_episodes.ps1`.
2. Öffne PowerShell und navigiere zum Speicherort des Skripts.
3. Führe das Skript mit `.\convert_episodes.ps1` aus.
4. Gib den Pfad zum Ordner mit den MKVs ein.
5. Gib die Startnummer der Episoden ein.
6. Das Skript konvertiert alle großen MKV-Dateien verlustfrei ins MP4-Format in den Unterordner `converted`.


---

## Hinweise

* Dieses Skript konvertiert ohne Neukodierung (copy), weshalb es sehr schnell und ohne Qualitätsverlust funktioniert.
* Stelle sicher, dass ffmpeg und ffprobe im System-PATH verfügbar sind, sonst funktioniert das Skript nicht.
* Die Sortierung der Episoden erfolgt alphabetisch nach Dateiname.
* Die MP4-Dateien werden im `converted`-Unterordner abgelegt.


---
