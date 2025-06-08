#!/bin/bash

#set -x

# Smart OpenCore EFI Exporter Script
# Automatically detects the EFI partition and exports the OC folder with versioned zip.

# Define output folder
EFIOutputFolder="$(dirname "$0")"
cd "$EFIOutputFolder" || exit 1

# Find the EFI partition identifier (usually diskXs1)
EFI_DISK=$(diskutil list | grep -i "EFI" | grep "disk" | head -n 1 | awk '{print $NF}')

if [ -z "$EFI_DISK" ]; then
  echo "EFI partition not found."
  exit 1
fi

# Mount EFI partition
echo "Mounting EFI partition: $EFI_DISK"
sudo diskutil mount "$EFI_DISK"

# Check mount point
EFI_MOUNT="/Volumes/EFI"
OC_PATH="$EFI_MOUNT/EFI/OC"

if [ ! -d "$OC_PATH" ]; then
  echo "OC folder not found in EFI. Path checked: $OC_PATH"
  exit 1
fi

# Copy OC folder
cp -R "$OC_PATH" "$EFIOutputFolder"

# Get OpenCore version from NVRAM
Version=$(nvram 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:opencore-version 2>/dev/null | sed -n 's/.*REL-*//p' | sed -e 's/-/_/g')

# Fallback version if NVRAM query fails
if [ -z "$Version" ]; then
  Version="unknown"
fi

# Create zip
ditto -c -k --sequesterRsrc --keepParent OC "$EFIOutputFolder/OC_${Version}.zip"

# Cleanup
rm -rf OC

echo "OC folder exported and zipped as OC_${Version}.zip"

exit 0
