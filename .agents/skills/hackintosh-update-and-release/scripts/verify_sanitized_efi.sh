#!/usr/bin/env bash
# verify_sanitized_efi.sh
# Verifies that an OpenCore EFI zip archive is valid, properly structured,
# and free of personal serial numbers / identifiers.

set -euo pipefail

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <path-to-efi-zip>"
    exit 1
fi

ZIP_FILE="$1"

if [ ! -f "$ZIP_FILE" ]; then
    echo "Error: Zip file '$ZIP_FILE' does not exist."
    exit 1
fi

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

echo "--> Unpacking $ZIP_FILE for verification..."
unzip -q "$ZIP_FILE" -d "$TEMP_DIR"

# Check standard EFI root structure
EFI_DIR=""
if [ -d "$TEMP_DIR/EFI" ]; then
    EFI_DIR="$TEMP_DIR/EFI"
elif [ -d "$TEMP_DIR/OC" ]; then
    EFI_DIR="$TEMP_DIR"
else
    echo "Error: Neither 'EFI/' nor 'OC/' folder found at archive root."
    exit 1
fi

OC_DIR="$EFI_DIR/OC"
CONFIG_PLIST="$OC_DIR/config.plist"

if [ ! -f "$CONFIG_PLIST" ]; then
    echo "Error: config.plist missing at $CONFIG_PLIST"
    exit 1
fi

echo "--> Verifying config.plist syntax..."
plutil -lint "$CONFIG_PLIST" > /dev/null

echo "--> Checking for personal serials in PlatformInfo..."
SERIAL=$(plutil -extract "PlatformInfo.Generic.SystemSerialNumber" raw "$CONFIG_PLIST" 2>/dev/null || echo "")
MLB=$(plutil -extract "PlatformInfo.Generic.MLB" raw "$CONFIG_PLIST" 2>/dev/null || echo "")
UUID=$(plutil -extract "PlatformInfo.Generic.SystemUUID" raw "$CONFIG_PLIST" 2>/dev/null || echo "")

ERRORS=0

is_sanitized_val() {
    local val="$1"
    if [ -z "$val" ]; then
        return 0
    fi
    case "$val" in
        "PLEASE INSERT YOUR OWN"*|"000000"*|"SystemSerialNumber"|"MLB"|"SystemUUID"|"[INSERT"*|"[YOUR"*)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Check Serial
if ! is_sanitized_val "$SERIAL"; then
    echo "WARNING/ERROR: SystemSerialNumber appears unsanitized: '$SERIAL'"
    ERRORS=$((ERRORS + 1))
else
    echo "✓ SystemSerialNumber is sanitized ('$SERIAL')"
fi

# Check MLB
if ! is_sanitized_val "$MLB"; then
    echo "WARNING/ERROR: MLB appears unsanitized: '$MLB'"
    ERRORS=$((ERRORS + 1))
else
    echo "✓ MLB is sanitized ('$MLB')"
fi

# Check UUID
if ! is_sanitized_val "$UUID"; then
    echo "WARNING/ERROR: SystemUUID appears unsanitized: '$UUID'"
    ERRORS=$((ERRORS + 1))
else
    echo "✓ SystemUUID is sanitized ('$UUID')"
fi

# Verify every PlatformInfo identity field, including the hardware ROM address.
python3 - "$CONFIG_PLIST" <<'PYVERIFY'
import plistlib, sys
config = plistlib.load(open(sys.argv[1], "rb"))
keys = {"SystemSerialNumber", "SystemUUID", "MLB", "BoardSerialNumber", "ChassisSerialNumber", "ROM"}
def check(node, path="PlatformInfo"):
    if not isinstance(node, dict):
        return
    for key, value in node.items():
        if key in keys:
            safe = value in ("", b"", "PLEASE INSERT YOUR OWN")
            if key == "ROM":
                safe = isinstance(value, bytes) and value == bytes(6)
            if not safe:
                raise SystemExit(f"Unsanitized identity field: {path}.{key}")
        elif isinstance(value, dict):
            check(value, f"{path}.{key}")
check(config.get("PlatformInfo", {}))
print("✓ All PlatformInfo identity fields, including ROM, are sanitized.")
PYVERIFY

# Check for junk files
JUNK=$(find "$TEMP_DIR" -name ".DS_Store" -o -name "*~" -o -name "*.bak" | wc -l | tr -d ' ')
if [ "$JUNK" -gt 0 ]; then
    echo "WARNING: Found $JUNK junk/temporary files inside archive."
    find "$TEMP_DIR" -name ".DS_Store" -o -name "*~" -o -name "*.bak"
    ERRORS=$((ERRORS + 1))
else
    echo "✓ No junk or backup files found."
fi

# Summary
if [ "$ERRORS" -gt 0 ]; then
    echo "EFI verification FAILED with $ERRORS error(s)."
    exit 1
else
    echo "✓ EFI archive successfully verified and safe for release!"
    exit 0
fi
