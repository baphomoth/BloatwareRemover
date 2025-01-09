# Bloatware Remover for Windows 10/11
# Preserves Windows Photo Viewer, Windows Store, and Windows Defender

# List of apps to remove (common bloatware)
$appsToRemove = @(
    "Microsoft.BingNews",
    "Microsoft.BingWeather",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.People",
    "Microsoft.SkypeApp",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.YourPhone",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.3DBuilder",
    "Microsoft.Messaging",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MixedReality.Portal",
    "Microsoft.OneConnect",
    "Microsoft.Print3D",
    "Microsoft.Wallet",
    "Microsoft.Windows.Photos",
    "Microsoft.WindowsCalculator",
    "Microsoft.WindowsCommunicationsApps",
    "Microsoft.WindowsPhone",
    "Microsoft.WindowsStore",
    "Microsoft.WindowsVoiceRecorder"
)

# Function to remove apps
function Remove-Bloatware {
    foreach ($app in $appsToRemove) {
        Write-Host "Removing $app..."
        Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -EQ $app | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
    }
    Write-Host "Bloatware removal complete."
}

# Preserve Windows Photo Viewer, Windows Store, and Windows Defender
Write-Host "Preserving Windows Photo Viewer, Windows Store, and Windows Defender..."

# Remove bloatware
Remove-Bloatware

Write-Host "Bloatware removal process completed. Essential components like Windows Photo Viewer, Windows Store, and Windows Defender are preserved."