# GitHub Release Guidelines & Template

When creating a GitHub release for the Hackintosh repository, strictly adhere to the established repository conventions:

## Tag and Title Formats
- **Tag Format**: `v<Major>.<Minor>.<Patch>` (e.g., `v4.0.0`, incrementing major version on major macOS releases, minor on macOS point releases, patch on minor EFI updates).
- **Title Format**: `OpenCore <OC_VERSION> build for macOS <MACOS_NAME> <MACOS_VERSION>`
  - *Example*: `OpenCore 1.0.7 build for macOS Tahoe 26.7.2`
  - *Example*: `OpenCore 1.0.4 build for macOS Sequoia 15.5`

## Release Notes Template

```markdown
### Changelog

1. macOS <MACOS_NAME> <MACOS_VERSION> support added.
2. OpenCore version updated to <OC_VERSION> (<BUILD_IDENTIFIER>).
3. <Key feature/driver update, e.g. Native Wi-Fi working with Apple Control Center via AirportItlwm.kext>.
4. <Audio driver update, e.g. Audio driven by SimpleHDA.kext>.
5. <Kexts and ACPI status, e.g. Kexts and ACPI updated>.
6. <Documentation updates, e.g. Added comprehensive INSTALLATION_GUIDE_OPENCORE.md>.
7. <Script updates, e.g. Updated Tools/extract_efi_without_serial.sh automation script>.

### What's Working/Not working

1. Full GPU Acceleration (<GPU Name and Metal support>).
2. Native Wi-Fi with Apple Control Center integration (<Wi-Fi Kext>).
3. Bluetooth 5.x (<Bluetooth Kext>).
4. Audio & Microphone (<Audio Kext>).
5. TrackPad & Keyboard (<Input Kexts>). Note: <Document any hardware electrical/grounding quirks if applicable>.
6. Sleep is not working (or working).

### Important

Please add `SystemSerialNumber`, `SystemUUID` and `MLB` to `config.plist`.
Please backup your EFI before upgrading.

## What's Changed

* <PR title> by @<author> in <PR_URL>

**Full Changelog**: https://github.com/<owner>/<repo>/compare/<PREVIOUS_TAG>...<NEW_TAG>
```

## Release Asset Format
- Attached file: `Tools/OC_<OC_VERSION_STR>_<YYYY>_<MM>_<DD>.zip`
- Ensure the archive contains root folders `EFI/OC` and `EFI/BOOT`.
- Ensure all serial numbers and IDs are sanitized using `scripts/verify_sanitized_efi.sh`.

