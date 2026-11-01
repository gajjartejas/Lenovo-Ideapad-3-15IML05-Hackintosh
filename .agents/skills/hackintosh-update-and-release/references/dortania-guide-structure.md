# Dortania-Based Installation Guide Structure

When writing or updating `INSTALLATION_GUIDE_OPENCORE.md`, reference the official Dortania OpenCore guides (such as Coffee Lake Plus / Comet Lake Laptop: `https://raw.githubusercontent.com/dortania/OpenCore-Install-Guide/refs/heads/master/config-laptop.plist/coffee-lake-plus.md`).

Structure the guide into clear, modular sections corresponding to OpenCore's architecture:

1. **Overview & Hardware Specifications**:
   - Processor, GPU, Audio, Wi-Fi, Storage, Input devices.
   - Target macOS versions and OpenCore version.

2. **ACPI Configuration**:
   - Required SSDTs (e.g. `SSDT-PLUG`, `SSDT-EC`, `SSDT-PNLF`, `SSDT-GPI0`, `SSDT-XOSI`, `SSDT-ALS0`).
   - Explanation of ACPI patches (e.g. `_OSI to XOSI`).

3. **Booter Configuration**:
   - Quirks (`ProvideConsoleGop`, `EnableSafeModeSlide`, `RebuildAppleMemoryMap`, `SyncRuntimePermissions`, etc.).

4. **DeviceProperties**:
   - IGPU framebuffer configuration (`AAPL,ig-platform-id`, `device-id`, stolenmem/fbmem).
   - Audio layout IDs (`layout-id`).

5. **Kernel Configuration**:
   - Kext load order (Lilu must be first, followed by VirtualSMC, then plugins and hardware drivers).
   - Kernel Quirks (`PanicNoKextDump`, `PowerTimeoutKernelPanic`, `ProvideCurrentCpuInfo`, etc.).
   - Model-specific patches (e.g. RTC AWAC, CPUS).

6. **Misc & Security**:
   - Boot Picker settings, Timeout, `Vault: Optional`, `ScanPolicy: 0`.
   - Security settings (`SecureBootModel`, `DmgLoading`, `AllowSetNVRAM`).

7. **NVRAM**:
   - `boot-args` (e.g. `-v keepsyms=1 debug=0x100 alcid=...`).
   - `prev-lang:kbd`.

8. **PlatformInfo**:
   - Recommended SMBIOS model (e.g. `MacBookPro16,3` for Comet Lake 10th Gen).
   - Clear warning to generate unique `SystemSerialNumber`, `SystemUUID`, and `MLB`.

9. **UEFI Settings**:
   - Drivers (`OpenRuntime.efi`, `OpenHfsPlus.efi` / `HfsPlus.efi`, `ResetNvramEntry.efi`).
   - UEFI Quirks (`RequestBootVarRouting`, `UnblockFsConnect`).

10. **Troubleshooting & Known Hardware Quirks**:
    - Hardware-specific bugs (e.g. charger grounding issue causing trackpad lag across Windows/Linux/macOS).
    - Sleep/wake state limitations.

