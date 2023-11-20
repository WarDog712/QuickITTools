# Imposta le variabili
$command = "netstat"
$message = "Risultato del comando: $command"

# Esegue il comando
$output = Invoke-Expression $command

# Invia il messaggio su Discord
$payload = @{
  content = $message
  embeds = @(
    {
      title = "Risultato del comando"
      fields = @(
        {
          name = "Comando"
          value = $command
        },
        {
          name = "Output"
          value = $output
        }
      )
    }
  )
}
Invoke-RestMethod -Method POST -Uri $webhook -Body $payload
