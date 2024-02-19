#!/bin/bash

# VyOS device details
VYOS_HOST=""
VYOS_USER=""
VYOS_PASS=""

# Remote server details
REMOTE_USER=""
REMOTE_HOST=""
REMOTE_DIR=""

# Temporary file to store configuration
CONFIG_FILE="/tmp/vyos_config_$(date +%Y%m%d).txt"

# SSH into VyOS device and extract configuration
sshpass -p "$VYOS_PASS" ssh "$VYOS_USER@$VYOS_HOST" "/opt/vyatta/bin/vyatta-op-cmd-wrapper show configuration commands" > "$CONFIG_FILE"

# Transfer configuration file to remote server via SCP
sshpass -p "$VYOS_PASS" scp "$CONFIG_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

# Clean up temporary file
rm "$CONFIG_FILE"

echo "Backup completed successfully."
