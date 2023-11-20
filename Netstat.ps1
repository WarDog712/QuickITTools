# Imposta le variabili
$command = "netstat"
$message = "Risultato del comando: $command"
# Esegue il comando
$output = Invoke-Expression $command

# Converte il valore del campo content in una stringa
$content = $output | Out-String

# Crea il payload JSON
$payload = @{
  'username' = 'Jarvis'
  'content' = $content
}

# Invia il messaggio su Discord
Invoke-RestMethod -ContentType 'application/json' -Method POST -Uri $webhook -Body $payload
