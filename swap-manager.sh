#!/bin/bash

# Ensure the script runs with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script as root or using sudo."
  exit 1
fi

# Check if a size argument was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <size_in_GB>"
  echo "Example: sudo $0 8"
  exit 1
fi

SWAP_SIZE="${1}G"
SWAP_DIR="/var/swap"
SWAP_FILE="$SWAP_DIR/swapfile"

echo "=== Starting Swap Configuration ==="

# 1. Safely disable and remove existing swap file if it exists
if [ -f "$SWAP_FILE" ]; then
  echo "Found existing swap file. Deactivating..."
  sudo swapoff "$SWAP_FILE" 2>/dev/null
  echo "Removing old swap file..."
  sudo rm -f "$SWAP_FILE"
fi

# 2. Ensure the BTRFS directory structure exists and is configured correctly
if [ ! -d "$SWAP_DIR" ]; then
  echo "Creating BTRFS subvolume at $SWAP_DIR..."
  sudo btrfs subvolume create "$SWAP_DIR"
  echo "Disabling Copy-on-Write (CoW) on $SWAP_DIR..."
  sudo chattr +C "$SWAP_DIR"
  sudo restorecon "$SWAP_DIR"
fi

# 3. Allocate the new swap file size
echo "Allocating $SWAP_SIZE to $SWAP_FILE..."
sudo fallocate -l "$SWAP_SIZE" "$SWAP_FILE"

# 4. Secure the file permissions
echo "Setting strict permissions (0600)..."
sudo chmod 0600 "$SWAP_FILE"

# 5. Format and activate the new swap space
echo "Formatting file as swap space..."
sudo mkswap "$SWAP_FILE"

echo "Activating new swap space..."
sudo swapon "$SWAP_FILE"

# 6. Make permanent in fstab only if it is not already listed
if ! grep -q "$SWAP_FILE" /etc/fstab; then
  echo "Adding swap entry to /etc/fstab for persistence..."
  echo "$SWAP_FILE none swap defaults 0 0" | sudo tee -a /etc/fstab
else
  echo "Fstab entry already exists. Skipping duplication."
fi

echo "=== Swap Configuration Complete ==="
echo "Current Swap Status:"
sudo swapon --show
