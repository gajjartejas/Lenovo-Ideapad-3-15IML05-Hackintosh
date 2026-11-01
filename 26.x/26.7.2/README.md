### Changelog

1. macOS Tahoe 26.7.2 support added.
2. OpenCore version updated to 1.0.7 (REL-107-2026-03-20).
3. SMBIOS configured to `MacBookPro16,3`.
4. Wi-Fi: Native Wi-Fi working out-of-the-box via `AirportItlwm.kext` (using [laobamac's](https://github.com/laobamac/itlwm) macOS 26 Tahoe release).
5. Bluetooth: Intel Wireless Bluetooth working via `IntelBluetoothFirmware.kext`, `IntelBTPatcher.kext`, and `BlueToolFixup.kext`.
6. USB: Configured with `USBToolBox.kext` and `UTBDefault.kext` along with `XHCI-unsupported.kext`.
7. Audio: Realtek ALC230 via `SimpleHDA.kext`.
8. Graphics: Full Intel UHD Graphics acceleration with Metal support.
9. Trackpad & Keyboard: `VoodooI2C.kext`, `VoodooI2CHID.kext`, and `VoodooPS2Controller.kext`.
10. Power management & Battery: `VirtualSMC.kext`, `SMCBatteryManager.kext`, `SMCProcessor.kext`, `SMCSuperIO.kext`, `SMCLightSensor.kext`, and `YogaSMC.kext`.
11. Updated ACPI SSDTs (`SSDT-ALS0.aml`, `SSDT-SBUS.aml`, `SSDT-EC.aml`, `SSDT-GPI0.aml`, `SSDT-MCHC.aml`, `SSDT-PLUG.aml`, `SSDT-PNLF.aml`, `SSDT-RTCAWAC.aml`, `SSDT-USBX.aml`, `SSDT-XOSI.aml`).

### What's Working / Not Working

#### Working
- Graphics Acceleration (Intel UHD Graphics)
- Display Brightness adjustment via Fn keys (F11/F12)
- Audio & Microphone (Realtek ALC230)
- Wi-Fi (Native via `AirportItlwm.kext` with Apple Control Center integration)
- Bluetooth (Intel 9560 via `IntelBluetoothFirmware.kext` + `BlueToolFixup.kext`)
- Battery status & temperature/fan sensors
- Keyboard & Touchpad
- USB ports (Type-A & Type-C)
- Webcam (Integrated Camera)
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

Please check the [Releases](https://github.com/gajjartejas/Lenovo-Ideapad-3-15IML05-Hackintosh/releases) section to download the pre-configured OpenCore EFI archive (`OC_107_2026_03_20.zip`).

