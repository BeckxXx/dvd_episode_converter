function Show-Menu {
    Clear-Host
    Write-Host "================= Menü =================" 
    Write-Host "1: MKV Ordner konvertieren"
    Write-Host "Q: Script beenden"
    Write-Host ""
}

do {
    Show-Menu
    $choice = Read-Host "Bitte Option wählen"
    switch ($choice.ToLower()) {
        "1" {
			# Ordnerpfad abfragen
			$folderPath = Read-Host "Bitte den Pfad zum Ordner mit den MKV-Dateien eingeben"

			# Startnummer der Episoden abfragen
			[int]$startNumber = Read-Host "Mit welcher Episodennummer soll begonnen werden?"

			# Basisname aus Ordnernamen ermitteln
			$folderName = [System.IO.Path]::GetFileName($folderPath.TrimEnd('\'))

			# Zielordner "converted" im angegebenen Ordner definieren
			$convertedFolder = Join-Path -Path $folderPath -ChildPath "converted"

			# Zielordner erstellen, falls er nicht existiert
			if (-not (Test-Path -Path $convertedFolder)) {
				New-Item -ItemType Directory -Path $convertedFolder | Out-Null
				Write-Host "Ordner 'converted' wurde erstellt: $convertedFolder"
			}

			# Alle MKV-Dateien > 1GB im Ordner finden und nach Name sortieren
			$files = Get-ChildItem -Path $folderPath -Filter *.mkv | Where-Object { $_.Length -gt 1GB } | Sort-Object Name

			# Zähler für Episoden-Nummer starten bei Startnummer
			$episodeNumber = $startNumber

			foreach ($file in $files) {
				Write-Host "Verarbeite Datei: $($file.Name)"
				
				# Ausgabe-Dateiname mit Ordnername und Episoden-Nummer
				$outfile = "{0}.E{1}.mp4" -f $folderName, $episodeNumber
				$outputPath = Join-Path -Path $convertedFolder -ChildPath $outfile
				
				Write-Host "Erstelle $outfile im Ordner 'converted'"
				& ffmpeg -i $file.FullName -c copy $outputPath
				
				# Nummer für nächste Episode erhöhen
				$episodeNumber++
			}

			Write-Host "Alle Episoden wurden erfolgreich im Ordner 'converted' erstellt."
		}
        "q" {
            Write-Host "Beende Script..."
        }
        default {
            Write-Host "Ungültige Auswahl!"
        }
    }
} until ($choice.ToLower() -eq "q")
