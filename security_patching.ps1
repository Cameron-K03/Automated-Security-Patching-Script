# Configurable variables
$logFile = "C:\logs\security_patching.log"
$emailRecipient = "youremail@example.com"
$smtpServer = "smtp.yourserver.com"

# Function to log messages
function Log-Message {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -Append -FilePath $logFile
}

# Function to send email
function Send-Email {
    param (
        [string]$subject,
        [string]$body
    )
    $mailMessage = New-Object system.net.mail.mailmessage
    $mailMessage.From = "security@yourdomain.com"
    $mailMessage.To.Add($emailRecipient)
    $mailMessage.Subject = $subject
    $mailMessage.Body = $body
    $smtpClient = New-Object system.net.mail.smtpclient($smtpServer)
    $smtpClient.Send($mailMessage)
}

# Start the security patching process
Log-Message "Security patching started."
try {
    Install-WindowsUpdate -AcceptAll -AutoReboot
    Log-Message "Security patching completed successfully."
    Send-Email -subject "Security Patching Successful" -body "The security patching process completed successfully."
} catch {
    Log-Message "Security patching failed: $_"
    Send-Email -subject "Security Patching Failed" -body "The security patching process failed. Check the log file for details: $logFile"
}
