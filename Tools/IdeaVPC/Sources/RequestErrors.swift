// SPDX-License-Identifier: GPL-2.0-only
import Foundation

/// Keep the authorization decision separate from driver policy failures.
/// Values match IOKit's IOReturn.h; root cannot clear a driver state lock.
enum RequestErrors {
    static let notPrivileged = Int32(bitPattern: 0xe00002c1)
    static let notPermitted = Int32(bitPattern: 0xe00002e2)
    static let badArgument = Int32(bitPattern: 0xe00002c2)
    static let unsupported = Int32(bitPattern: 0xe00002c7)
    static let ioError = Int32(bitPattern: 0xe00002ca)
    static let helperMarker = "IDEAVPC_WRITE_ERROR="
    static func execute(key: String, driverVersion: String, canAuthorize: Bool,
                        write: () -> Int32, authorize: () -> String?) -> String? {
        let code = write()
        if code == 0 { return nil }
        // NotPermitted can be a driver rejection, not an administrator check.
        // Only a real privilege violation warrants one authorization attempt.
        if code == notPrivileged && canAuthorize { return authorize() }
        return message(code, key: key, driverVersion: driverVersion)
    }
    static func message(_ code: Int32, key: String, driverVersion: String = "") -> String {
        let hex = String(format: "0x%08X", UInt32(bitPattern: code))
        if code == notPermitted {
            if key == "ConservationMode", driverVersion.hasPrefix("REL-200-2026-11-13") {
                return "YogaSMC 2.0.0 refused the manual conservation change because of a driver lock regression (\(hex)). Replace that development kext with the corrected 2.0.1 build and reboot. An administrator password cannot clear this lock."
            }
            return "The driver or macOS refused \(key) (not permitted, \(hex)). This is not an incorrect-password error; the app will not retry it with administrator privileges."
        }
        if code == notPrivileged { return "macOS denied the required privilege for \(key) (\(hex)). Authorization did not grant the driver access needed for this request." }
        if code == badArgument { return "\(key) is unavailable or its requested value is invalid (\(hex)). Refresh the device state before trying again." }
        if code == unsupported { return "This driver does not support \(key) (\(hex))." }
        if code == ioError { return "The driver could not complete or confirm \(key) (\(hex)). The setting may be unchanged or partially applied. Refresh before retrying." }
        return "\(key) failed with driver error \(hex) (\(code)). Refresh the device state before retrying."
    }
    static func integer(after marker: String, in text: String) -> Int32? {
        guard let range = text.range(of: marker) else { return nil }
        let suffix = text[range.upperBound...]
        let digits = suffix.prefix { $0 == "-" || ($0 >= "0" && $0 <= "9") }
        return Int32(digits)
    }
    static func authorizedResult(output: String, terminationStatus: Int32, key: String, driverVersion: String) -> String? {
        if terminationStatus == 0 && output.trimmingCharacters(in: .whitespacesAndNewlines) == "IDEAVPC_AUTH_OK" { return nil }
        if let code = integer(after: helperMarker, in: output) { return message(code, key: key, driverVersion: driverVersion) }
        if integer(after: "IDEAVPC_AUTH_FAILURE=", in: output) == -128 { return "Authorization was cancelled. No privileged retry was performed." }
        return "The authorized helper could not complete \(key). No success was confirmed. Check that this app still exists at its launch location, then refresh before retrying."
    }
}
