### Changelog

1. **macOS Tahoe 26.7.3 (Build 25G342)** support added.
2. **OpenCore version updated to 1.0.8** (`REL-108-2026-09-27`).
3. **SMBIOS configured to `MacBookPro16,2`** (optimized power management profile for 10th Gen Comet Lake-U).
4. **Boot Screen Optimization**: Appended `-igfxbls` to `boot-args` for smooth display backlight initialization, completely resolving the 2–3 minute black screen hang prior to the login window.
5. **Bluetooth & USB Fixes**:
   - Disabled faulty `USBMap.kext` which previously caused Intel XHCI controller crashes (`unsupported speed mantissa`) and forced the controller into D3 sleep, breaking webcam and Bluetooth.
   - Disabled `SSDT-RHUB.aml` to preserve Lenovo factory ACPI `_UPC` (Type 255) radio control descriptors on port `HS10`.
   - Corrected load order: `IntelBTPatcher.kext` now loads before `BlueToolFixup.kext`, resolving BLE reconnection failures (`encryptionPending 1`).
   - Added NVRAM delete keys for `bluetoothExternalDongleFailed` and `bluetoothInternalControllerInfo` to clear stale zero-byte controller caches.
6. **ACPI Refinements**:
   - Injected clean `SSDT-PNLF.aml` (`_UID = 0x13`) and removed deprecated `SSDT-PNLFCFL.aml` and `PNLF to XNLF` patch.
   - Fixed `SSDT-TPD0.aml` fallback method signature from `XTSM ()` to `XTSM (Arg0, Arg1, Arg2, Arg3)` to prevent ACPI interpreter runtime errors.
   - Scoped ACPI binary patches (`HPET`, `IPIC`, `RTC`, `TIMR`, `GPRW`) strictly to `TableSignature: DSDT`.
7. **Boot Picker Speed**: Disabled `AudioDxe.efi`, boot chime (`PlayChime = Disabled`), and UEFI audio polling (`AudioSupport = False`).

### What's Working / Not Working

#### Working
- Graphics Acceleration (Intel UHD Graphics 630 with Metal 3 support)
- Display Brightness adjustment via Fn keys (F11/F12) and smooth boot transitions
- Audio & Microphone (Realtek ALC230 via `SimpleHDA.kext`)
- Wi-Fi (Native via `AirportItlwm.kext` with Apple Control Center integration)
- Bluetooth (Intel 9560 via `IntelBluetoothFirmware.kext` + `IntelBTPatcher.kext` + `BlueToolFixup.kext`)
- Battery status & temperature/fan sensors (`VirtualSMC.kext`)
- Keyboard & Touchpad (`VoodooI2C.kext` + `VoodooPS2Controller.kext`)
- USB ports (Type-A & Type-C) & Integrated Webcam
- NVMe storage power management (`NVMeFix.kext`)
- App Store & Apple ID services (with unique serials)

#### Not Working / Known Issues
1. Sleep / Wake (native sleep issue on this laptop).
2. Trackpad lag and elevated CPU usage (10% to 15%): Occurs specifically when connected to the charger due to a hardware electrical/grounding issue present across Windows, Linux, and macOS alike (operates normally on battery power).
3. Native Apple AirDrop & Continuity features require a native Apple Broadcom Wi-Fi/BT card.

### Important

Please insert your own `SystemSerialNumber`, `SystemUUID`, and `MLB` into `config.plist`.
Always back up your working EFI partition before upgrading.

### Download

Please check the [Releases](https://github.com/gajjartejas/Lenovo-Ideapad-3-15IML05-Hackintosh/releases) section to download the pre-configured OpenCore EFI archive (`OC_108_2026_09_27.zip`).
