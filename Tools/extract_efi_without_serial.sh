#!/bin/bash

#set -x

# Note: Based on CloverPackage MountESP script.


#EFIOutputFolder=$(~/Desktop/EFI_FOLDER)
EFIOutputFolder=$(dirname $0)
cd $EFIOutputFolder

sudo diskutil mount $1
cp -R /Volumes/SYSTEM_DRV/EFI/OC $EFIOutputFolder
cd $EFIOutputFolder
plutil -replace PlatformInfo.DataHub.SystemSerialNumber -string "PLEASE INSERT YOUR OWN" OC/config.plist
plutil -replace PlatformInfo.DataHub.SystemUUID -string "PLEASE INSERT YOUR OWN" OC/config.plist
plutil -replace PlatformInfo.Generic.SystemSerialNumber -string "PLEASE INSERT YOUR OWN" OC/config.plist
plutil -replace PlatformInfo.Generic.SystemUUID -string "PLEASE INSERT YOUR OWN" OC/config.plist
plutil -replace PlatformInfo.Generic.MLB -string "PLEASE INSERT YOUR OWN" OC/config.plist
plutil -replace PlatformInfo.PlatformNVRAM.MLB -string "PLEASE INSERT YOUR OWN" OC/config.plist
Version=$(nvram 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:opencore-version 2>/dev/null | sed -n 's/.*REL-*//p' | sed  -e 's/-/_/g' )
ditto -c -k --sequesterRsrc --keepParent OC $EFIOutputFolder/OC_$Version.zip
rm -rf OC
exit 0
