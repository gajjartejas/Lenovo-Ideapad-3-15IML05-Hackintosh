// SPDX-License-Identifier: GPL-2.0-only
// Native controls informed by zhen-zen/YogaSMC's YogaSMCPane (see NOTICE.md).
import Foundation
import CoreFoundation

struct PaneState: Sendable {
    var driver = "Unavailable"
    var numbers: [String: Int] = [:]
    var booleans: [String: Bool] = [:]
    var dytcFunctions: [String] = []
    var batteries: [Int: [String: Int]] = [:]
    var batteryID: String?
    var ecReason: String?
    var isThink: Bool { driver == "ThinkVPC" }
    static func number(_ value: Any?) -> Int? {
        guard let n = value as? NSNumber, CFGetTypeID(n) != CFBooleanGetTypeID() else { return nil }
        return n.intValue
    }
    static func boolean(_ value: Any?) -> Bool? {
        guard let n = value as? NSNumber, CFGetTypeID(n) == CFBooleanGetTypeID() else { return nil }
        return n.boolValue
    }
    init(_ properties: [String: Any] = [:]) {
        driver = properties["IOClass"] as? String ?? "Unavailable"
        for key in ["BacklightLevel", "BacklightTimeout", "AutoBacklight", "FanControl"] {
            numbers[key] = Self.number(properties[key])
        }
        for key in ["ClamshellMode", "LEDSupport", "Dual fan"] { booleans[key] = Self.boolean(properties[key]) }
        if let dytc = properties["DYTC"] as? [String: Any], let functions = dytc["Function Status"] as? [String: Any] {
            // A false status means supported but currently inactive, not unsupported.
            dytcFunctions = functions.keys.sorted()
        }
        for (index, name) in ["BAT_ANY", "BAT_PRIMARY", "BAT_SECONDARY"].enumerated() {
            if let dict = properties[name] as? [String: Any] {
                var values: [String: Int] = [:]
                for key in ["BCTG", "BCSG"] { values[key] = Self.number(dict[key]) }
                batteries[index] = values
            }
        }
        batteryID = (properties["Battery 0"] as? [String: Any])?["ID"] as? String
        ecReason = properties["EC Capability Reason"] as? String
    }
    func thresholds(_ index: Int) -> (start: Int, stop: Int)? {
        guard let b = batteries[index], let start = b["BCTG"], let stop = b["BCSG"],
              start >= 0, stop >= 0, start & 0xff < 100, stop & 0xff < 100 else { return nil }
        let upper = stop & 0xff == 0 ? 100 : stop & 0xff
        guard start & 0xff < upper else { return nil }
        return (start & 0xff, upper)
    }
}
struct PropertyWrite {
    let key: String
    let value: Any
}
enum PanePolicy {
    static func integers(_ value: String, count: Int) -> [Int]? {
        let parts = value.split(separator: ",", omittingEmptySubsequences: false)
        guard parts.count == count else { return nil }
        var result: [Int] = []
        for part in parts {
            guard let number = Int(part), String(number) == part else { return nil }
            result.append(number)
        }
        return result
    }
    static func perform(_ plan: [PropertyWrite], write: (PropertyWrite) -> Int32) -> Int32 {
        for property in plan { let result = write(property); if result != 0 { return result } }
        return 0
    }
    static let booleanKeys = ["ConservationMode", "RapidChargeMode", "FnlockMode", "AlwaysOnUSBMode", "ClamshellMode"]
    static func plan(_ key: String, _ value: String, properties: [String: Any]) -> [PropertyWrite]? {
        let state = PaneState(properties)
        if booleanKeys.contains(key) {
            guard ["true", "false"].contains(value), PaneState.boolean(properties[key]) != nil else { return nil }
            return [.init(key: key, value: NSNumber(value: value == "true"))]
        }
        if key == "DYTCMode" {
            guard state.dytcFunctions.contains("MMC"), ["Quiet", "Balanced", "Performance"].contains(value) else { return nil }
            return [.init(key: key, value: value)]
        }
        if key == "InspectBattery" {
            guard state.isThink, let index = Int(value), String(index) == value, (0...2).contains(index) else { return nil }
            return [.init(key: "Battery", value: NSNumber(value: index))]
        }
        if key == "Thresholds" {
            guard let parts = integers(value, count: 3), let current = state.thresholds(parts[0]), state.isThink,
                  (0...99).contains(parts[1]), (1...100).contains(parts[2]), parts[1] < parts[2] else { return nil }
            let start = PropertyWrite(key: "setCMstart", value: NSNumber(value: parts[1]))
            let stop = PropertyWrite(key: "setCMstop", value: NSNumber(value: parts[2] == 100 ? 0 : parts[2]))
            // Change the non-conflicting boundary first. Stop on the first driver error.
            return [.init(key: "Battery", value: NSNumber(value: parts[0]))] + (parts[2] <= current.start ? [start, stop] : [stop, start])
        }
        if key == "LED" {
            guard let parts = integers(value, count: 2), state.isThink, state.booleans["LEDSupport"] == true,
                  (0...15).contains(parts[0]), (0...3).contains(parts[1]) else { return nil }
            return [.init(key: key, value: NSNumber(value: parts[0] + [0, 0x80, 0xa0, 0xc0][parts[1]]))]
        }
        guard let number = Int(value), String(number) == value else { return nil }
        switch key {
        case "BacklightLevel": guard state.numbers[key] != nil, (0...2).contains(number) else { return nil }
        case "BacklightTimeout": guard state.numbers[key] != nil, (0...3600).contains(number) else { return nil }
        case "AutoBacklight": guard state.numbers[key] != nil, (0...31).contains(number) else { return nil }
        case "DYTCPSCMode": guard state.dytcFunctions.contains("PSC"), (1...8).contains(number) || number == 15 else { return nil }
        default: return nil
        }
        return [.init(key: key, value: NSNumber(value: number))]
    }
    static func matches(_ key: String, value: String, controls: [String: String], pane: PaneState) -> Bool? {
        if key == "LED" || key == "InspectBattery" { return nil } // No authoritative LED state is published by the driver.
        if key == "Thresholds" {
            guard let p = integers(value, count: 3), let actual = pane.thresholds(p[0]) else { return false }
            return actual.start == p[1] && actual.stop == p[2]
        }
        let expected = value == "true" ? "On" : value == "false" ? "Off" : value
        if key == "DYTCMode" {
            let actual = controls[key]?.lowercased() == "balance" ? "balanced" : controls[key]?.lowercased()
            return actual == expected.lowercased() || controls[key]?.lowercased() == expected.lowercased()
        }
        if key == "DYTCPSCMode" {
            // Named modes (including firmware's Balance/auto) are not numeric read-back.
            guard let actual = controls[key], Int(actual) != nil else { return nil }
            return actual == value
        }
        return controls[key]?.lowercased() == expected.lowercased()
    }
}
