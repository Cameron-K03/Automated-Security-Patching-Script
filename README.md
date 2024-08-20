# Automated Security Patching Script

This repository contains scripts for automating the process of security patching on Linux and Windows systems. The scripts log the actions taken and send an email notification upon completion, indicating whether the patching was successful or if there were any issues.

## Scripts Included

- **Linux Security Patching Script**: `security_patching.sh`
- **Windows Security Patching Script**: `security_patching.ps1`

## How It Works

### Linux (`security_patching.sh`)

- **Updates and Upgrades**: Runs `apt-get update`, `apt-get upgrade`, `apt-get dist-upgrade`, and `apt-get autoremove` to update and upgrade all packages.
- **Logging**: Logs the start and end of the patching process, including any errors.
- **Email Notifications**: Sends an email notification upon completion, indicating success or failure.

### Windows (`security_patching.ps1`)

- **Install Updates**: Uses `Install-WindowsUpdate` to install all available updates and reboots automatically if necessary.
- **Logging**: Logs the start and end of the patching process, including any errors.
- **Email Notifications**: Sends an email notification upon completion, indicating success or failure.

## Usage

### Linux

1. Make the script executable:
    ```bash
    chmod +x security_patching.sh
    ```
2. Run the script:
    ```bash
    ./security_patching.sh
    ```

### Windows

1. Run the script in PowerShell as Administrator:
    ```powershell
    .\security_patching.ps1
    ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
