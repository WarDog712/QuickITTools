# Imposta le variabili
$command = "netstat"
$message = "Risultato del comando: $command"

# Esegue il comando
$output = Invoke-Expression $command

# Invia il messaggio su Discord
$payload = @{
  'username' = 'Jarvis'
  'content' = $output | Out-String`}`
Invoke-RestMethod -ContentType 'Application/Json' -Method POST -Uri $webhook -Body ($payload | ConvertTo-Json)
