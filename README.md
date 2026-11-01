<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->

[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)

<!-- ALL-CONTRIBUTORS-BADGE:END -->

[<img align="right" src="https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/instagram.svg" width="50" height="50" />](http://www.instagram.com/gajjartejas)
[<img align="right" src="https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/twitter.svg" width="50" height="50" />](http://www.twitter.com/gajjartejas)
[<img align="right" src="https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/reddit.svg" width="50" height="50" />](http://www.reddit.com/u/gajjartejas)
[<img align="right" src="https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/telegram.svg" width="50" height="50" />](https://t.me/indianhackintosh)

# Lenovo-Ideapad-3-15IML05-Hackintosh

[![Github release](https://img.shields.io/github/release/gajjartejas/Lenovo-Ideapad-3-15IML05-Hackintosh.svg?color=blue)](https://github.com/gajjartejas/Lenovo-Ideapad-3-15IML05-Hackintosh/releases/latest)
[![Github downloads](https://img.shields.io/github/downloads/gajjartejas/Lenovo-Ideapad-3-15IML05-Hackintosh/total.svg?color=blue)](https://github.com/gajjartejas/Lenovo-Ideapad-3-15IML05-Hackintosh/releases)
[![Donate with PayPal](https://img.shields.io/badge/paypal-donate-red.svg)](https://paypal.me/gajjartejas)

Goal of this repo is to run macOS on Lenovo IdeaPad 3 15IML05 Laptop.

|          macOS Ventura 13.3.1           |           macOS Sonoma 14.5           |          macOS Sequoia 15.5           |           macOS Tahoe 26.7.2            |
| :-------------------------------------: | :-----------------------------------: | :-----------------------------------: | :-------------------------------------: |
| ![alt text](13.x/13.3.1/screenshot.png) | ![alt text](14.x/14.5/screenshot.png) | ![alt text](15.x/15.5/screenshot.png) | ![alt text](26.x/26.7.2/screenshot.png) |

## OpenCore Installation Guide

Go to [INSTALLATION_GUIDE_OPENCORE.md](INSTALLATION_GUIDE_OPENCORE.md)(**Detailed guide**)

## Wi-Fi Note

Native Wi-Fi works out-of-the-box via [`AirportItlwm.kext`](https://github.com/laobamac/itlwm/releases) (maintained by [laobamac](https://github.com/laobamac/itlwm) with builds for macOS 14 Sonoma, macOS 15 Sequoia, and macOS 26 Tahoe) with full native macOS Control Center integration. HeliPort is not required.

## About this Laptop

### Original Hardware Info 💻

| Type         | Spec                                                            | Status  | Driver / Kext Link                                                                                                                                                 |
| :----------- | :-------------------------------------------------------------- | :------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Computer     | Lenovo IdeaPad 3 15IML05 U1                                     | Working | -                                                                                                                                                                  |
| BIOS Version | LENOVO DXCN39WW (10/13/2021)                                    | Working | -                                                                                                                                                                  |
| CPU          | DualCore Intel Core i3-10110U, 3700 MHz (37 x 100)              | Working | Native Power Management via [SSDT-PLUG](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html)                                                 |
| Chipset      | Intel Comet Point-LP, Intel Comet Lake-U                        | Working | -                                                                                                                                                                  |
| Graphics     | Intel(R) UHD Graphics                                           | Working | [WhateverGreen.kext](https://github.com/acidanthera/WhateverGreen)                                                                                                 |
| Audio        | Realtek ALC 230, Codec ID:10EC0230 / 17AA383A                   | Working | [SimpleHDA.kext](https://github.com/laobamac/SimpleHDA)                                                                                                            |
| Ethernet     | Not Present                                                     | N/A     | -                                                                                                                                                                  |
| WiFi         | Intel(R) Wireless-AC 9560                                       | Working | [AirportItlwm.kext](https://github.com/laobamac/itlwm/releases)                                                                                                     |
| Bluetooth    | Intel(R) Wireless Bluetooth(R) - USB\VID_8087&PID_0AAA&REV_0002 | Working | [IntelBluetoothFirmware.kext](https://github.com/lshbluesky/IntelBluetoothFirmware) + [BlueToolFixup.kext](https://github.com/acidanthera/BrcmPatchRAM)          |
| Touchpad     | I2C ELAN0001 [PnP - MSFT0001]                                   | Working | [VoodooI2C.kext](https://github.com/VoodooI2C/VoodooI2C) + [VoodooI2CHID.kext](https://github.com/VoodooI2C/VoodooI2C)                                           |
| Keyboard     | Standard PS/2 Keyboard                                          | Working | [VoodooPS2Controller.kext](https://github.com/acidanthera/VoodooPS2)                                                                                               |
| Webcam       | Integrated Camera - USB\VID_30C9&PID_001B&REV_0005&MI_00        | Working | Native (USB UVC)                                                                                                                                                   |
| Battery      | Sunwoda - L19D3PF5 - Rechargeable LiP - 46270 mWh               | Working | [SMCBatteryManager.kext](https://github.com/acidanthera/VirtualSMC) + [YogaSMC.kext](https://github.com/zhen-zen/YogaSMC)                                         |

### Modifications/Accessories 🔨

| Type                                                                                 | Spec | Status  |
| :----------------------------------------------------------------------------------- | :--- | :------ |
| Wireless Bluetooth Mouse Rechargeable Mouse                                          | -    | Working |
| G.Skill Ripjaws SO-DIMM 16GB (1 \* 16GB) DDR4 3200 CL22-22-22-52 1.20V Laptop Memory | -    | Working |

### Software Status 👨‍💻

| Type                            | Spec | Status                                                                                                                     |
| :------------------------------ | :--- | :------------------------------------------------------------------------------------------------------------------------- |
| Battery Status                  | -    | Working                                                                                                                    |
| Brightness With keys(F11 - F12) | -    | Working                                                                                                                    |
| Sleep                           | -    | Not Working                                                                                                                |
| Trackpad                        | -    | Laggy and High CPU usages when charging (Hardware grounding issue across Windows, Linux & macOS; works normally on battery) |

> [!NOTE]
> **Trackpad Lag**: The trackpad lag and elevated CPU usage (10% to 15%) occurs specifically when the laptop is connected to the charger. This is a known hardware electrical/grounding issue on this model present across Windows, Linux, and macOS. When running on battery power alone, the trackpad operates normally.

### Kexts Used (Grouped by Hardware Feature)

| Hardware Feature | Kext | Status | Info / Purpose |
| :--- | :--- | :---: | :--- |
| **System & Core** | [Lilu.kext](https://github.com/acidanthera/Lilu) | Enabled | Arbitrary kext and process patching engine for macOS. |
| | [VirtualSMC.kext](https://github.com/acidanthera/VirtualSMC) | Enabled | SMC Emulator Layer; essential for macOS boot. |
| | [RestrictEvents.kext](https://github.com/acidanthera/RestrictEvents) | Enabled | Blocks unwanted background daemons and unlocks hardware features. |
| **Graphics & Backlight** | [WhateverGreen.kext](https://github.com/acidanthera/WhateverGreen) | Enabled | Framebuffer and display patches for Intel UHD Graphics 630. |
| | [BrightnessKeys.kext](https://github.com/acidanthera/BrightnessKeys) | Enabled | Handler for display brightness function keys (F11/F12) without DSDT patches. |
| | [SMCLightSensor.kext](https://github.com/acidanthera/VirtualSMC) | Enabled | Ambient light sensor emulation for display backlight persistence. |
| **Audio** | [SimpleHDA.kext](https://github.com/laobamac/SimpleHDA) | Enabled | Native lightweight AppleHDA audio driver for Realtek ALC230 codec. |
| **Wi-Fi & Bluetooth** | [AirportItlwm.kext](https://github.com/laobamac/itlwm/releases) | Enabled | Intel Wireless-AC 9560 native Wi-Fi driver with native macOS Control Center integration (via [laobamac/itlwm](https://github.com/laobamac/itlwm)). |
| | [IntelBluetoothFirmware.kext](https://github.com/lshbluesky/IntelBluetoothFirmware) | Enabled | Intel Bluetooth firmware uploader for Intel AC 9560. |
| | [IntelBTPatcher.kext](https://github.com/lshbluesky/IntelBluetoothFirmware) | Enabled | Fixes Intel Bluetooth driver bugs and patches functionality on macOS. |
| | [BlueToolFixup.kext](https://github.com/acidanthera/BrcmPatchRAM) | Enabled | Required for macOS 12 Monterey through macOS 26 Tahoe Bluetooth stack. |
| **Input (Trackpad & Keyboard)** | [VoodooI2C.kext](https://github.com/VoodooI2C/VoodooI2C) | Enabled | Core I2C bus controller driver for ELAN0001 I2C touchpad. |
| | [VoodooI2CHID.kext](https://github.com/VoodooI2C/VoodooI2C) | Enabled | I2C HID satellite driver for multi-touch gestures. |
| | [VoodooPS2Controller.kext](https://github.com/acidanthera/VoodooPS2) | Enabled | PS/2 keyboard controller driver. |
| **Sensors & Power** | [SMCProcessor.kext](https://github.com/acidanthera/VirtualSMC) | Enabled | Processor Temperature Monitoring. |
| | [SMCSuperIO.kext](https://github.com/acidanthera/VirtualSMC) | Enabled | Motherboard hardware sensor and fan speed readouts. |
| | [SMCBatteryManager.kext](https://github.com/acidanthera/VirtualSMC) | Enabled | Battery status and charge cycle monitoring. |
| | [YogaSMC.kext](https://github.com/zhen-zen/YogaSMC) | Enabled | Lenovo IdeaPad OEM hardware features (battery conservation mode, etc.). |
| **USB & Storage** | [USBToolBox.kext](https://github.com/USBToolBox/kext) | Enabled | USB port mapping kernel extension. |
| | [UTBDefault.kext](https://github.com/USBToolBox/kext) | Enabled | Default USB 2.0 / 3.0 port mapping configuration. |
| | [XHCI-unsupported.kext](https://github.com/dortania/OpenCore-Install-Guide) | Enabled | Non-standard XHCI USB controller compatibility. |
| | [NVMeFix.kext](https://github.com/acidanthera/NVMeFix) | Enabled | Power management and APST state optimization for non-Apple NVMe SSDs. |

### SSDTs Used (Grouped by Hardware Feature)

| Hardware Feature | SSDT | Info / Purpose | Reference Link |
| :--- | :--- | :--- | :--- |
| **System & Core** | `SSDT-EC.aml` | Injects fake Embedded Controller device (`ACID0001`) with Darwin conditional | [Dortania EC Guide](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-fix.html) |
| | `SSDT-RTCAWAC.aml` | Sets `STAS = 1` to resolve AWAC / RTC clock lockup on Comet Lake | [Dortania AWAC Guide](https://dortania.github.io/Getting-Started-With-ACPI/Universal/awac.html) |
| **CPU Power Management** | `SSDT-PLUG.aml` | Injects `plugin-type=1` under `PR00` for native CPU Power Management (XCPM) | [Dortania Power Guide](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html) |
| **Graphics & Backlight** | `SSDT-PNLF.aml` | Defines `PNLF` device under `PCI0.GFX0` for display backlight control | [Dortania Backlight Guide](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/backlight.html) |
| | `SSDT-ALS0.aml` | Ambient Light Sensor (`ACPI0008`) stub to preserve display brightness across reboots | [OpenCorePkg ALS0](https://github.com/Acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-ALS0.dsl) |
| **Input (Trackpad)** | `SSDT-GPI0.aml` | Enables Intel GPIO controller (`_STA = 0x0F`) for VoodooI2C GPIO pinning | [VoodooI2C GPIO Pinning](https://voodooi2c.github.io/#GPIO%20Pinning/GPIO%20Pinning) |
| | `SSDT-XOSI.aml` | Windows OSI emulation to route I2C trackpad interrupts properly | [Dortania Trackpad Guide](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/trackpad.html) |
| **USB Power Supply** | `SSDT-USBX.aml` | Injects generic USB power supply properties (`kUSBSleepPortCurrentLimit`, etc.) | [Dortania USBX Guide](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-fix.html#fixing-embedded-controller-ssdt-ecusbx) |
| **Motherboard & Bus** | `SSDT-MCHC.aml` | Adds missing `MCHC` device under `PCI0` for AppleSMBusController | [Dortania SMBus Guide](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html) |
| | `SSDT-SBUS.aml` | Adds `BUS0` under `PCI0.SBUS` for system management bus functionality | [Dortania SMBus Guide](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html) |

### TODO

- Sleep issue
- Trackpad lag and elevated CPU usage when connected to charger (hardware electrical/grounding issue).
- Suggest to me via issue.

### Telegram Channel

- [India Hackintosh Community Group](https://t.me/indianhackintosh)
- [India Hackintosh Channel](https://t.me/hackintoshcommunity)

### Credits

- [Apple](https://www.apple.com) for macOS.
- [Acidanthera](https://github.com/acidanthera) for OpenCorePkg, Lilu, VirtualSMC, WhateverGreen, BrightnessKeys, RestrictEvents, NVMeFix, BrcmPatchRAM, and VoodooPS2.
- [laobamac](https://github.com/laobamac) for SimpleHDA and AirportItlwm / itlwm.
- [lshbluesky](https://github.com/lshbluesky) for IntelBluetoothFirmware and IntelBTPatcher.
- [OpenIntelWireless](https://github.com/OpenIntelWireless) for Intel Wi-Fi & Bluetooth drivers and HeliPort.
- [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C) for I2C Touchpad driver and gesture support.
- [USBToolBox](https://github.com/USBToolBox) for USB mapping utilities and companion kext.
- [zhen-zen](https://github.com/zhen-zen) for YogaSMC.
- [Dortania](https://dortania.github.io/) for comprehensive OpenCore installation and post-install guides.
- [corpnewt](https://github.com/corpnewt) for GenSMBIOS, ProperTree, and SSDTTime.
- [RehabMan](https://github.com/RehabMan) for essential ACPI patches and guides.
- [daliansky](https://github.com/daliansky) for ACPI hotpatch samples and Dortania contributions.
- [Steve Zheng](https://github.com/stevezhengshiqi) for ACPI patches.
- [Sniki](https://github.com/Sniki) for ACPI patching guides.
- [Moh_Ameen](https://github.com/ameenjuz) for initial IdeaPad patches.
- And everyone in the hackintosh community who contributed to open-source drivers and tools.
