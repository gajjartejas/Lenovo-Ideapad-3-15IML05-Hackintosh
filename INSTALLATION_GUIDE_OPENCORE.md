# OpenCore Installation Guide for Lenovo IdeaPad 3 15IML05

Comprehensive step-by-step OpenCore configuration and installation guide tailored for the **Lenovo IdeaPad 3 15IML05** (Intel 10th Gen Comet Lake-U, Core i3-10110U).

This guide analyzes the settings from the pre-configured release package ([`Tools/OC_108_2026_09_27.zip`](file:///Users/tejas/Desktop/GitHub/Lenovo-Ideapad-3-15IML05-Hackintosh/Tools/OC_108_2026_09_27.zip)) and highlights specific differences from the generic Dortania guide.

---

## 1. Official Reference Guide

* **Dortania Guide**: [Dortania OpenCore Install Guide: Laptop Coffee Lake Plus and Comet Lake](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake-plus.html)
* **Raw Source**: [coffee-lake-plus.md](https://raw.githubusercontent.com/dortania/OpenCore-Install-Guide/refs/heads/master/config-laptop.plist/coffee-lake-plus.md)
* **OpenCore Version**: `1.0.8` (`REL-108-2026-09-27`)

---

## 2. Hardware Specifications

| Component | Hardware Details |
| :--- | :--- |
| **Model** | Lenovo IdeaPad 3 15IML05 (Type 81WB) |
| **Processor** | Intel® Core™ i3-10110U @ 2.10 GHz (Comet Lake-U, 2 Cores / 4 Threads, Turbo 4.10 GHz) |
| **Graphics** | Intel® UHD Graphics 630 (Mobile GT2, Comet Lake) |
| **Chipset** | Intel Comet Point-LP |
| **Audio** | Realtek ALC230 (Codec ID: `0x10EC0230` / `0x17AA383A`) |
| **Wi-Fi & BT** | Intel® Wireless-AC 9560 (802.11ac + Bluetooth 5.1, CNVi interface) |
| **Trackpad** | ELAN0001 (`MSFT0001`) I2C HID Trackpad |
| **Keyboard** | Standard PS/2 Keyboard |
| **Storage** | M.2 NVMe PCIe SSD + 2.5" SATA Slot |

---

## 3. Recommended BIOS Settings

Restart laptop and tap **F2** (or Fn+F2) to enter BIOS Setup:

### Disable:
- **Fast Boot**
- **Secure Boot**
- **Intel Platform Trust Technology (PTT) / Intel SGX**
- **Intel Virtualization Technology for Directed I/O (VT-d)** (or keep enabled, handled by `DisableIoMapper: True`)
- **Wake on LAN**

### Enable:
- **Intel Virtualization Technology (VT-x)**
- **SATA Controller Mode**: `AHCI`
- **UEFI Boot Mode** (Legacy/CSM disabled)
- **USB Boot**

---

## 4. OpenCore Section-by-Section Configuration

### 4.1 ACPI

The Dortania guide suggests creating standard pre-built SSDTs. For this laptop, the ACPI tables and patches have been customized to ensure full stability:

#### Added SSDTs (`ACPI -> Add`)

| SSDT | Purpose & Function | Difference from Generic Guide |
| :--- | :--- | :--- |
| **`SSDT-EC.aml`** | Injects fake Embedded Controller device (`ACID0001`) with Darwin conditional | Generic guide uses `SSDT-EC-USBX`. Here EC and USBX are separate for cleaner power control. |
| **`SSDT-USBX.aml`** | Injects generic USB power supply properties (`kUSBSleepPortCurrentLimit`, etc.) | Separated from EC. |
| **`SSDT-RTCAWAC.aml`** | Sets `STAS = 1` to force legacy RTC enablement on 300-series / Comet Lake | Prevents boot freeze on 10th Gen Comet Lake boards with locked AWAC clock. |
| **`SSDT-PLUG.aml`** | Injects `plugin-type=1` under `\_SB.PR00` | Enables native CPU Power Management (XCPM) for the Core i3-10110U. |
| **`SSDT-PNLF.aml`** | Defines `PNLF` device under `\_SB.PCI0.GFX0` for display backlight | Paired with `PNLF to XNLF` rename to prevent OEM ACPI collision. |
| **`SSDT-GPI0.aml`** | Enables Intel GPIO controller (`_STA = 0x0F`) | Unhides the GPIO pin for I2C bus communication. |
| **`SSDT-XOSI.aml`** | Emulates Windows 10/11 environment (`_OSI` calls) | Crucial for the ELAN0001 touchpad to expose I2C endpoints instead of fallback PS/2. |
| **`SSDT-ALS0.aml`** | Adds dummy Ambient Light Sensor (`ACPI0008`) | Restores display brightness levels across reboots without an ambient sensor. |
| **`SSDT-MCHC.aml`** | Defines missing `MCHC` device under `\_SB.PCI0` | Required for AppleSMBusController loading. |
| **`SSDT-SBUS.aml`** | Adds `BUS0` under `\_SB.PCI0.SBUS` | Enhances SMBus device tree compatibility. |

#### ACPI Binary Patches (`ACPI -> Patch`)

| Patch Comment | Find (HEX) | Replace (HEX) | Explanation |
| :--- | :--- | :--- | :--- |
| **EC0 _STA to XSTA** | `5214135F535441` | `52141358535441` | Renames OEM `EC0._STA` so `SSDT-EC.aml` can supply the clean EC device. |
| **GPI0 _STA to XSTA** | `5F53544100A00A9347` | `5853544100A00A9347` | Disables OEM GPI0 status check, allowing `SSDT-GPI0.aml` to activate GPIO pinning. |
| **PNLF to XNLF** | `504E4C46` | `584E4C46` | Prevents conflicts between laptop BIOS backlight code and `SSDT-PNLF.aml`. |
| **_OSI to XOSI** | `5F4F5349` | `584F5349` | Diverts all OS queries to `SSDT-XOSI.aml`. |

#### ACPI Quirks
* `ResetLogoStatus`: `True`
* All other ACPI quirks set to `False`.

---

### 4.2 Booter

Booter settings patch `boot.efi` and coordinate memory allocation with `OpenRuntime.efi`:

| Quirk | Value | Notes & Specifics |
| :--- | :--- | :--- |
| **`AvoidRuntimeDefrag`** | `True` | Essential for UEFI runtime memory. |
| **`DevirtualiseMmio`** | `True` | Frees up memory holes on Comet Lake laptops. |
| **`EnableSafeModeSlide`** | `True` | Enables safe mode support. |
| **`FixupAppleEfiImages`** | `True` | **Special (OpenCore 1.0.0+)**: Fixes modern kernel cache and EFI image verification on macOS 14+ / Sequoia / Tahoe. |
| **`ProtectUefiServices`** | `True` | Protects firmware memory map from corruption on 10th Gen boards. |
| **`ProvideCustomSlide`** | `True` | Overcomes conflicting memory slide regions. |
| **`RebuildAppleMemoryMap`**| `True` | Guarantees proper memory map for APFS. |
| **`ResizeAppleGpuBars`** | `-1` | Prevents GPU BAR resize allocation panics. |
| **`SetupVirtualMap`** | `True` | Maps virtual memory to physical addresses. |
| **`SyncRuntimePermissions`**| `True` | Ensures memory permissions are synchronized for macOS. |

---

### 4.3 DeviceProperties

Configured under `DeviceProperties -> Add`:

```xml
<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
<dict>
    <key>AAPL,ig-platform-id</key>
    <data>CQClPg==</data> <!-- 0x3EA50009: Mobile Comet Lake GT2 Framebuffer -->
    <key>device-id</key>
    <data>mz4AAA==</data> <!-- 0x3E9B: Intel UHD Graphics 630 Spoof -->
    <key>framebuffer-patch-enable</key>
    <data>AQAAAA==</data> <!-- Enable framebuffer patching -->
    <key>framebuffer-stolenmem</key>
    <data>AAAwAQ==</data> <!-- 19 MB stolen memory -->
    <key>framebuffer-fbmem</key>
    <data>AACQAA==</data> <!-- 9 MB framebuffer memory -->
</dict>
```

#### Why These Values?
1. **`AAPL,ig-platform-id` = `0900A53E`**: Matches mobile Intel UHD Graphics for Comet Lake with 3 display pipes.
2. **`device-id` = `9B3E0000` (`0x3E9B`)**: The native Core i3-10110U graphics ID (`0x9B41`) lacks native acceleration in macOS drivers; spoofing to `0x3E9B` activates full Metal 3 acceleration and HDMI/LVDS output.
3. **Audio**: Unlike generic setups that hardcode `layout-id` under `Pci(0x1F,0x3)`, this configuration handles Realtek ALC230 cleanly via `SimpleHDA.kext`, eliminating layout conflicts.

---

### 4.4 Kernel

#### 1. Kext Load Order & Conflict Prevention

OpenCore executes kexts in strict order. In `Tools/OC_107_2026_03_20.zip`, kexts are ordered to prevent panics:

1. **`Lilu.kext`**: Must load first.
2. **`BrightnessKeys.kext`**: Native Fn-key brightness mapping.
3. **`IntelBluetoothFirmware.kext`**: Firmware uploader for the Intel AC 9560 Bluetooth controller.
4. **`IntelBTPatcher.kext`**: (**Load before BlueToolFixup**): Patches Apple Bluetooth daemon and handshake routines.
5. **`BlueToolFixup.kext`**: (`MinKernel: 21.0.0`) Bluetooth stack compatibility for macOS 12 Monterey through macOS 26 Tahoe.
6. **`NVMeFix.kext`**: (`MinKernel: 18.0.0`) Power management for third-party NVMe drives.
6. **`RestrictEvents.kext`**: Unlocks macOS features and blocks unwanted crashreporter daemons.
7. **`VirtualSMC.kext`** + Satellites:
   - `SMCBatteryManager.kext` (Battery readouts)
   - `SMCLightSensor.kext` (Light sensor emulation)
   - `SMCProcessor.kext` (CPU temperature monitoring)
   - `SMCSuperIO.kext` (Fan sensor readouts)
8. **`USBToolBox.kext` & `UTBDefault.kext`**: USB 2.0 / USB 3.0 mapping.
9. **`VoodooI2C.kext`** & Satellites (Loaded in precise order):
   - `VoodooI2CServices.kext`
   - `VoodooGPIO.kext`
   - `VoodooI2C.kext`
   - `VoodooInput.kext`
   - `VoodooI2CHID.kext`
10. **`VoodooPS2Controller.kext`**:
    - **CRITICAL**: `VoodooPS2Controller/Contents/PlugIns/VoodooInput.kext` is **Disabled** (`Enabled: False`). Having two `VoodooInput` instances active triggers an instant kernel panic at boot.
    - `VoodooPS2Keyboard.kext`: Enabled
    - `VoodooPS2Mouse.kext`: Enabled
    - `VoodooPS2Trackpad.kext`: Enabled
11. **`WhateverGreen.kext`**: Display patching companion.
12. **`XHCI-unsupported.kext`**: Non-standard XHCI controllers.
13. **`YogaSMC.kext`**: Special Lenovo OEM hardware controls (battery threshold, conservation mode).
14. **`AirportItlwm.kext`**: Intel Wireless-AC 9560 Wi-Fi driver with native macOS Control Center integration (using [laobamac's](https://github.com/laobamac/itlwm/releases) modern macOS releases).

#### 2. Kernel Quirks

| Quirk | Value | Reason |
| :--- | :--- | :--- |
| **`AppleXcpmCfgLock`** | `True` | **Crucial**: Lenovo BIOS locks CFG-Lock (MSR 0xE2); this bypasses the lock without BIOS modding. |
| **`CustomSMBIOSGuid`** | `True` | Paired with `UpdateSMBIOSMode: Custom` to protect Windows & Linux OEM activation on dual-boot systems. |
| **`DisableIoMapper`** | `True` | Bypasses VT-d conflicts without having to disable VT-x in BIOS. |
| **`DisableLinkeditJettison`** | `True` | Prevents macOS from discarding `__LINKEDIT` sections needed by Lilu. |
| **`PanicNoKextDump`** | `True` | Cleaner kernel panic output during troubleshooting. |
| **`PowerTimeoutKernelPanic`** | `True` | Fixes sleep/wake panics caused by device power change timeouts. |
| **`SetApfsTrimTimeout`** | `-1` | Prevents boot slowdowns on non-Apple NVMe drives during TRIM operations. |

---

### 4.5 Misc

#### Boot (`Misc -> Boot`)
* **`HideAuxiliary`**: `True` (Hides Recovery and tools until Spacebar is pressed).
* **`PickerMode`**: `Builtin` (Lightweight text picker; change to `External` if using OpenCanopy icons).
* **`Timeout`**: `5` seconds.
* **`ShowPicker`**: `True`.

#### Security (`Misc -> Security`)
* **`AllowSetDefault`**: `True` (Allows setting default boot volume via `Ctrl + Enter`).
* **`BlacklistAppleUpdate`**: `True` (Blocks OEM firmware update packages).
* **`DmgLoading`**: `Signed`
* **`ScanPolicy`**: `0` (Discovers all bootable OS partitions).
* **`SecureBootModel`**: `Disabled` (Required for booting modern unsigned Hackintosh kexts).
* **`Vault`**: `Optional` (Allows booting without cryptographic EFI vault).

---

### 4.6 NVRAM

Configured under `NVRAM -> Add -> 7C436110-AB2A-4BBB-A880-FE41995C9F82`:

#### `boot-args`
```
-v debug=0x100 keepsyms=1 -igfxbls -vi2c-force-polling
```

* **`-v`**: Verbose boot mode (shows detailed boot logs).
* **`debug=0x100`**: Disables auto-reboot on kernel panic.
* **`keepsyms=1`**: Preserves debug symbols in panic reports.
* **`-igfxbls`**: WhateverGreen backlight smoother; activates smooth display transitions and prevents the 2–3 minute black screen hang prior to login window.
* **`-vi2c-force-polling`**: **Hardware-Specific Workaround**: Forces `VoodooI2C` into polling mode. Resolves interrupt contention on the ELAN0001 touchpad.

#### Other NVRAM Properties
* **`csr-active-config`**: `<030A0000>` (`0x0A03` SIP relaxed for seamless kext execution).
* **`prev-lang:kbd`**: `<>` (Empty string defaults to system language).
* **`WriteFlash`**: `True` (Enables NVRAM variable persistence).

---

### 4.7 PlatformInfo & SMBIOS

* **`SystemProductName`**: `MacBookPro16,2`
  * Optimal official Apple match for 10th Gen Intel Ice Lake / Comet Lake with Intel Iris Plus / UHD 630.
* **`Automatic`**: `True`
* **`UpdateSMBIOSMode`**: `Custom`
  * Paired with `Kernel -> Quirks -> CustomSMBIOSGuid: True` so that Windows and Linux boot unaffected by Apple SMBIOS data.
* **`Generic` Identifiers**:
  * Generate using [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) selecting `MacBookPro16,2`:
    * `SystemSerialNumber`
    * `SystemUUID`
    * `MLB`

---

### 4.8 UEFI

#### Drivers (`UEFI -> Drivers`)
1. **`OpenRuntime.efi`**: Mandatory for memory management and NVRAM.
2. **`HfsPlus.efi`**: Fast filesystem driver for HFS+ installer/recovery partitions.
3. **`apfs_aligned.efi`**: APFS driver variant for boot speed and compatibility.
4. **`ResetNvramEntry.efi`**: Adds a one-click NVRAM reset option in the OpenCore boot menu.

#### UEFI Quirks
* **`ReleaseUsbOwnership`**: `True` (**Critical for Laptops**; releases USB controller ownership from BIOS to avoid keyboard/mouse lockups during boot).
* **`RequestBootVarRouting`**: `True` (Enables the "Startup Disk" preference pane).
* **`EnableVectorAcceleration`**: `True` (Optimizes AVX performance).

---

## 5. Hardware Workarounds & Observations

### Trackpad Charger Grounding Issue
> [!WARNING]
> On the Lenovo IdeaPad 3 15IML05, the ELAN0001 trackpad exhibits severe lag, jumpiness, and elevated CPU usage (10% to 15%) **specifically when the laptop is plugged into the charger**.
> 
> * **Root Cause**: Electrical grounding / EMI noise from the AC power adapter leaking through the laptop chassis.
> * **Behavior**: This issue occurs identically on **Windows 10/11**, **Linux**, and **macOS**.
> * **Mitigation**: When operating on battery power, the trackpad functions normally and smoothly. Using `-vi2c-force-polling` in `boot-args` minimizes driver lockups when charging.

### Wi-Fi on macOS 15+ (Sequoia) & macOS 26.x (Tahoe)
* Native Wi-Fi support is fully restored via [`AirportItlwm.kext`](https://github.com/laobamac/itlwm/releases) from [laobamac's itlwm repository](https://github.com/laobamac/itlwm).
* Integrates directly with native Apple Control Center Wi-Fi menus. HeliPort is not required.

---

## 6. Post-Installation Steps

1. **Mount EFI Partition**:
   ```bash
   # Identify your EFI disk
   diskutil list
   # Mount the EFI volume
   sudo diskutil mount /dev/disk0s1
   ```
2. **Copy EFI Folder**: Copy the sanitized `EFI` folder from [`Tools/OC_108_2026_09_27.zip`](file:///Users/tejas/Desktop/GitHub/Lenovo-Ideapad-3-15IML05-Hackintosh/Tools/OC_108_2026_09_27.zip) into your mounted `/Volumes/EFI/`.
3. **Populate SMBIOS**: Open `EFI/OC/config.plist` using ProperTree and fill in your unique `SystemSerialNumber`, `SystemUUID`, and `MLB` generated via GenSMBIOS.
4. **Reset NVRAM**: On first boot from the new EFI, select **Reset NVRAM** from the OpenCore picker.
