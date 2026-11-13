import Foundation
import IOKit

struct DiagnosticSection: Identifiable, Sendable {
    let title: String
    let symbol: String
    let rows: [Detail]
    var id: String { title }
}
enum Diagnostics {
    static func defaultEFI() -> String {
        if let saved = UserDefaults.standard.string(forKey: "EFIConfigPath") { return saved }
        var base = Bundle.main.bundleURL.deletingLastPathComponent()
        for _ in 0..<5 {
            let file = base.appendingPathComponent("OC/config.plist")
            if FileManager.default.fileExists(atPath: file.path) { return file.path }
            base.deleteLastPathComponent()
        }
        return ""
    }
    static func named(_ name: String) -> [String: Any] {
        let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceNameMatching(name))
        guard service != 0 else { return [:] }; defer { IOObjectRelease(service) }
        var properties: Unmanaged<CFMutableDictionary>?
        guard IORegistryEntryCreateCFProperties(service, &properties, kCFAllocatorDefault, 0) == KERN_SUCCESS else { return [:] }
        return properties?.takeRetainedValue() as? [String: Any] ?? [:]
    }
    static func attached(_ name: String) -> Bool {
        let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching(name))
        guard service != 0 else { return false }; IOObjectRelease(service); return true
    }
    static func value(_ p: [String: Any], _ key: String) -> String {
        guard let v = p[key] else { return "Not reported" }
        if let data = v as? Data {
            if key == "plugin-type", let first = data.first { return String(first) }
            return data.map { String(format: "%02X", $0) }.joined()
        }
        return VPC.display(v)
    }
    static func collect(configPath: String) -> [DiagnosticSection] {
        var sections: [DiagnosticSection] = []
        let touch = VPC.properties("VoodooI2CDeviceNub")
        let hid = VPC.properties("VoodooI2CHIDDevice")
        let pin = (touch["gpioPin"] as? NSNumber).map { "\($0.intValue) (0x\(String($0.intValue, radix: 16).uppercased()))" } ?? "Not reported"
        sections.append(.init(title: "Touchpad · live input path", symbol: "hand.draw", rows: [
            .init(name: "TPD0 ACPI device", value: named("TPD0").isEmpty ? "Not observed" : "Present"),
            .init(name: "VoodooI2C device", value: touch.isEmpty ? "Not observed" : "Attached"),
            .init(name: "HID touchpad driver", value: hid.isEmpty ? "Not observed" : "Attached"),
            .init(name: "Interrupt mode", value: value(touch, "Interrupt Mode")),
            .init(name: "GPIO pin", value: pin),
            .init(name: "GPIO IRQ", value: value(touch, "gpioIRQ")),
            .init(name: "Advertised report interval (µs)", value: value(hid, "ReportInterval")),
            .init(name: "Multitouch event driver", value: attached("VoodooI2CPrecisionTouchpadHIDEventDriver") ? "Attached" : "Not observed")
        ]))
        let cpu = named("PR00")
        sections.append(.init(title: "CPU · SSDT-PLUG effect", symbol: "cpu", rows: [
            .init(name: "PR00 plugin-type", value: value(cpu, "plugin-type")),
            .init(name: "X86PlatformPlugin", value: attached("X86PlatformPlugin") ? "Attached" : "Not observed"),
            .init(name: "Interpretation", value: "Live effect; does not identify the AML filename")
        ]))
        var gpu = named("IGPU"); if gpu.isEmpty { gpu = named("GFX0") }
        sections.append(.init(title: "Display brightness & graphics", symbol: "sun.max", rows: [
            .init(name: "PNLF ACPI device", value: named("PNLF").isEmpty ? "Not observed" : "Present"),
            .init(name: "AppleBacklightDisplay", value: attached("AppleBacklightDisplay") ? "Attached" : "Not observed"),
            .init(name: "IntelAccelerator", value: attached("IntelAccelerator") ? "Attached" : "Not observed"),
            .init(name: "Alternative backlight fix", value: value(gpu, "enable-backlight-registers-alternative-fix")),
            .init(name: "Platform ID (raw bytes)", value: value(gpu, "AAPL,ig-platform-id")),
            .init(name: "Device ID (raw bytes)", value: value(gpu, "device-id")),
            .init(name: "Keyboard backlight", value: value(VPC.properties("IdeaVPC"), "BacklightLevel"))
        ]))
        sections.append(.init(title: "Other ACPI effects", symbol: "puzzlepiece.extension", rows: [
            .init(name: "EC0", value: named("EC0").isEmpty ? "Not observed" : "Present"),
            .init(name: "RTC", value: named("RTC").isEmpty ? "Not observed" : "Present"),
            .init(name: "AppleHPET", value: attached("AppleHPET") ? "Attached" : "Not observed"),
            .init(name: "USBX", value: named("USBX").isEmpty ? "Not observed" : "Present"),
            .init(name: "AppleSMBusPCI", value: attached("AppleSMBusPCI") ? "Attached" : "Not observed")
        ]))
        var loaded: [String: String] = [:]
        let process = Process(); process.executableURL = URL(fileURLWithPath: "/usr/bin/kmutil"); process.arguments = ["showloaded"]
        let pipe = Pipe(); process.standardOutput = pipe; process.standardError = FileHandle.nullDevice
        var loadError: String?
        do {
            try process.run()
            let data = pipe.fileHandleForReading.readDataToEndOfFile(); process.waitUntilExit()
            if process.terminationStatus != 0 { loadError = "Loaded-kext query unavailable" }
            let output = String(data: data, encoding: .utf8) ?? ""
            let regex = try NSRegularExpression(pattern: #"\s([A-Za-z0-9_-]+(?:\.[A-Za-z0-9_-]+)+)\s+\(([^)]+)\)"#)
            for m in regex.matches(in: output, range: NSRange(output.startIndex..., in: output)) {
                if let id = Range(m.range(at: 1), in: output), let version = Range(m.range(at: 2), in: output) { loaded[String(output[id])] = String(output[version]) }
            }
        } catch { loadError = error.localizedDescription }
        let defaults: [(String, String)] = [("Lilu", "as.vit9696.Lilu"), ("VirtualSMC", "as.vit9696.VirtualSMC"), ("WhateverGreen", "as.vit9696.WhateverGreen"), ("YogaSMC", "org.zhen.YogaSMC"), ("VoodooI2C", "com.alexandred.VoodooI2C"), ("VoodooGPIO", "org.coolstar.VoodooGPIO"), ("VoodooI2CHID", "com.alexandred.VoodooI2CHID"), ("VoodooInput", "me.kishorprins.VoodooInput"), ("SMCBatteryManager", "ru.usrsse2.SMCBatteryManager"), ("ECEnabler", "com.1Revenger1.ECEnabler"), ("AppleALC", "as.vit9696.AppleALC"), ("BrightnessKeys", "as.acidanthera.BrightnessKeys")]
        var kexts = Dictionary(uniqueKeysWithValues: defaults.map { ($0.1, $0.0) })
        var codeless: [Detail] = []
        if !configPath.isEmpty {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: configPath)), let p = (try? PropertyListSerialization.propertyList(from: data, format: nil)) as? [String: Any] {
                let oc = URL(fileURLWithPath: configPath).deletingLastPathComponent()
                if let kernel = p["Kernel"] as? [String: Any], let entries = kernel["Add"] as? [[String: Any]] {
                    for e in entries {
                        guard let path = e["BundlePath"] as? String else { continue }
                        let infoURL = oc.appendingPathComponent("Kexts").appendingPathComponent(path).appendingPathComponent("Contents/Info.plist")
                        guard let data = try? Data(contentsOf: infoURL), let info = (try? PropertyListSerialization.propertyList(from: data, format: nil)) as? [String: Any], let id = info["CFBundleIdentifier"] as? String else { continue }
                        let name = URL(fileURLWithPath: path).deletingPathExtension().lastPathComponent
                        if info["CFBundleExecutable"] != nil { kexts = kexts.filter { $0.value != name }; kexts[id] = name }
                        else { codeless.append(.init(name: name, value: "Codeless · configured \((e["Enabled"] as? Bool) == true ? "on" : "off")")) }
                    }
                }
                if let acpi = p["ACPI"] as? [String: Any], let entries = acpi["Add"] as? [[String: Any]] {
                    let rows = entries.compactMap { e -> Detail? in
                        guard let name = e["Path"] as? String else { return nil }
                        let exists = FileManager.default.fileExists(atPath: oc.appendingPathComponent("ACPI").appendingPathComponent(name).path)
                        return .init(name: name, value: "\((e["Enabled"] as? Bool) == true ? "Enabled" : "Disabled") · \(exists ? "File present" : "File missing")")
                    }
                    sections.append(.init(title: "Selected EFI · ACPI configuration", symbol: "folder", rows: rows))
                }
            } else { sections.append(.init(title: "Selected EFI", symbol: "folder.badge.questionmark", rows: [.init(name: "Config", value: "Could not read config.plist. Choose it again.")])) }
        }
        let rows = kexts.sorted { $0.value.localizedStandardCompare($1.value) == .orderedAscending }.map { id, name in
            Detail(name: name, value: loadError ?? loaded[id].map { "Loaded · \($0)" } ?? "Not observed loaded")
        }
        sections.append(.init(title: "Custom kexts · live loaded versions", symbol: "shippingbox", rows: rows))
        if !codeless.isEmpty { sections.append(.init(title: "Selected EFI · codeless kexts", symbol: "doc", rows: codeless)) }
        return sections
    }
}
