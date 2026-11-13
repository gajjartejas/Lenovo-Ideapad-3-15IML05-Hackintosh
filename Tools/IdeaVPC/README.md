# IdeaVPC

A small native SwiftUI app for the Lenovo IdeaPad YogaSMC `IdeaVPC` service. Built and read-tested on Intel macOS 26.7.3 with YogaSMC 1.5.3. Requires macOS 26 and the existing, working YogaSMC driver. It does not install or modify EFI/kexts.

## Run

Download `IdeaVPC_1.0_build3.zip` from the repository releases, extract it and open `IdeaVPC.app`. For a local build, open `Build/IdeaVPC.app`. The app is locally ad-hoc signed, not notarized for distribution. No external runtime, package dependencies, network requests, telemetry, or persistent privileged helper.

## Features

- Controls: conservation mode, rapid charging, Fn lock, and named Quiet/Balanced/Performance DYTC modes. Always-on USB appears only as a control if the service reports a boolean value. Unsupported keyboard backlight is displayed as information.
- Battery: capacity, raw capacity where available, estimated capacity health, voltage/current, cycle count, adapter/charging state, and extra temperature/manufacture data published by IdeaVPC.
- Device: driver version, EC capability, DYTC details, and firmware capability flags. Presence flags are not proof a hardware feature works.
- Read-only startup and automatic property refresh every 15 seconds while the app is active. Reading IORegistry does not force a firmware update; published driver values can be cached.
- Explicit user changes use IOKit. If macOS rejects a request for insufficient privileges, the OS administrator dialog can run this same executable for a single allowlisted request. No password is collected by the app or stored. Requests are followed by a read-back; a driver return code alone is not treated as firmware success. Read-back can still reflect cached state rather than independently verified physical behaviour.
- No raw EC writes, arbitrary ACPI calls, configurable charge percentage, fan controls, or automatic application of settings on launch.

## Build

Requires Xcode Command Line Tools / Swift and macOS SDK:

```sh
./build.sh
open Build/IdeaVPC.app
```

Built with release optimization (`swiftc -O`). The script creates and locally signs the standalone app bundle. Source is in `Sources/IdeaVPC.swift`.

Read-only connection check:

```sh
Build/IdeaVPC.app/Contents/MacOS/IdeaVPC --diagnose
```

The executable's `--set KEY VALUE` route is used internally for an authorized setting change. It accepts only the named boolean controls and DYTC modes; do not use it as a status query.

## Verification

- Optimized build and code-signature verification passed.
- Live diagnostic mode connected to IdeaVPC and read 16 battery rows / 15 device rows at test time.
- Native Controls window inspected: conservation on, rapid charging off, Fn lock off, Performance selected; unsupported controls shown as unavailable.
- Invalid write requests are rejected before contacting the driver.
- Actual hardware-changing commands and administrator elevation have not been exercised. No charging/performance settings were changed for QA. The Battery/Device data model was verified against live reads; automated navigation to those pages timed out in the UI automation tool.

## References

- https://github.com/zhen-zen/YogaSMC
- https://github.com/zhen-zen/YogaSMC/blob/master/YogaSMC/YogaVPC/IdeaVPC.cpp
- https://github.com/zhen-zen/YogaSMC/blob/master/YogaSMC/YogaVPC.cpp
- https://developer.apple.com/design/human-interface-guidelines/settings

## Visual update — 2026-11-13

- Battery dashboard: accessible charge ring, capacity-health/temperature/cycle cards and native Swift Charts views for charge and signed battery power.
- History records actual samples only, every 15 seconds while active. Limited to 240 in-memory samples; no fabricated history or continuous animation. A single sample is shown as a dot.
- Controls: coloured SF Symbol badges, descriptive rows and native switches/picker.
- Device: connection and EC cards, firmware capability grid and icon-led details.
- App icon: original vector-drawn laptop/battery mark, generated with AppKit at every macOS icon size and packaged as AppIcon.icns. Rebuild from Assets/GenerateIcon.swift automatically when needed.
- Build, signature, live diagnostic read and native Battery accessibility inspection passed. The page reported 69% charge, 88% estimated capacity health, 30.9°C and 81 cycles at verification. Screenshot capture timed out in the automation tool, so full visual inspection of all pages was not completed.
- No hardware settings changed during this update.

## Diagnostics update — 2026-11-13

- Fixed chart metric selector wrapping by hiding the redundant visual label, retaining its accessible name and giving the segmented control a fixed intrinsic width.
- Diagnostics page reads live TPD0/VoodooI2C attachment, interrupt mode, GPIO pin/IRQ and report interval; CPU plugin-type/X86PlatformPlugin; PNLF, display backlight and Intel acceleration; other observed ACPI/driver effects.
- Loaded third-party kext versions come from kmutil on demand, not every battery refresh. Detection of a driver is distinct from a functional hardware test.
- An optional config.plist reference displays configured SSDTs and file presence, and discovers custom kext bundle IDs. Choose another file using the page's button. The app only reads the file and does not mount EFI. The selected file can differ from the actual boot EFI.
- AML load provenance cannot be reliably established by filename using IORegistry; the app explicitly separates live effects from configured entries. Codeless kexts have their own section.
- Verified the live diagnostics command: TPD0 attached in GPIO mode, pin 86/0x56, IRQ 8; plugin-type 1 with X86PlatformPlugin; PNLF, AppleBacklightDisplay and IntelAccelerator present. No hardware settings changed.

Read-only diagnostics:

```sh
Build/IdeaVPC.app/Contents/MacOS/IdeaVPC --diagnostics
```

## Release verification — 2026-11-13

Fresh Battery, Controls, Device and Diagnostics screenshots are included in the [main README](../../README.md#ideapad-vpc-tool). All four pages were visually inspected against the live IdeaVPC service on macOS 26.7.3. No firmware controls were changed. Earlier screenshot/navigation timeouts above describe previous development checks.

The release EFI enables YogaSMC 1.5.3 and disables SSDT-MEM2; SSDT-ECRW and SSDT-YVPC remain disabled. The optional diagnostics reference can point to a different config than the boot EFI; its entries are configuration evidence only.
