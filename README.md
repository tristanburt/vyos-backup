# VyOS Configuration Backup Script

This script facilitates the automated backup of VyOS device configurations to a remote server using SSH and SCP. I haven't been able to find a good way to backup my VyOS config since moving to it from OPNSense. Could be better and use purely key based authentication but it serves it's purpose for now and I'll come back eventually to tweak it.

## Prerequisites

- **sshpass**: This script uses `sshpass` to provide the password for SSH authentication non-interactively. Ensure `sshpass` is installed on the system where this script will be executed.

```bash
RHEL/CentOS
sudo yum install sshpass

Debian/Ubuntu
sudo apt-get install sshpass
```

## Usage

1. Clone or download the script to your local machine.
2. Modify the following variables in the script to match your environment:
   - `VYOS_HOST`: IP address or hostname of the VyOS device.
   - `VYOS_USER`: Username to authenticate with the VyOS device.
   - `VYOS_PASS`: Password to authenticate with the VyOS device.
   - `REMOTE_USER`: Username to authenticate with the remote server.
   - `REMOTE_HOST`: IP address or hostname of the remote server.
   - `REMOTE_DIR`: Destination directory on the remote server where the configuration file will be stored.
3. Ensure the script has execute permissions (`chmod +x vyos_config_backup.sh`).
4. Execute the script: `./vyos_config_backup.sh`.

## Cronjob

Edit your crontab

```bash
crontab -e
```
Enter the following. Make sure to change your file path for the script

``` bash
0 0 * * * /path/to/vyos_backup.sh
```

## Description

This script performs the following actions:

1. SSH into the VyOS device using provided credentials.
2. Extract the current configuration using `show configuration commands` command.
3. Transfer the configuration file to the specified remote server using SCP.
4. Clean up temporary files created during the process.

## Notes

- Ensure SSH access is enabled on both the VyOS device and the remote server.
- It's recommended to use SSH key-based authentication instead of password authentication for improved security.
- Review and test the script in a non-production environment before deploying it to a production environment.

## Disclaimer

Use this script at your own risk.
