import Foundation

@main struct PolicyTests {
    static var checks = 0
    static func check(_ condition: @autoclosure () -> Bool, _ name: String) {
        checks += 1
        guard condition() else { fatalError("FAILED: \(name)") }
    }
    static func main() {
        let idea: [String: Any] = ["IOClass": "IdeaVPC", "ConservationMode": true, "RapidChargeMode": false, "BacklightLevel": "unsupported", "BacklightTimeout": 0, "DYTC": ["Function Status": ["MMC": false, "STP": true], "PerfMode": "Balance"]]
        check(PaneState.number(true) == nil, "booleans are not numeric capabilities")
        check(PaneState.boolean(1) == nil, "numeric values are not boolean capabilities")
        check(PanePolicy.plan("BacklightLevel", "1", properties: idea) == nil, "unsupported backlight cannot be written")
        check(PanePolicy.plan("ClamshellMode", "true", properties: idea) == nil, "absent clamshell cannot be written")
        check(PanePolicy.plan("ConservationMode", "true", properties: idea)?.first?.value as? NSNumber == NSNumber(value: true), "boolean payload remains a CFBoolean")
        check(PanePolicy.plan("ConservationMode", "1", properties: idea) == nil, "reject ambiguous booleans")
        check(PanePolicy.plan("DYTCMode", "Balanced", properties: idea)?.first?.key == "DYTCMode", "write correct driver key")
        check(PanePolicy.plan("DYTC", "Performance", properties: idea) == nil, "reject obsolete DYTC property")
        check(PanePolicy.plan("DYTCMode", "RawCommand", properties: idea) == nil, "reject raw commands")
        check(PanePolicy.plan("DYTCPSCMode", "15", properties: idea) == nil, "no PSC on MMC-only hardware")
        check(PanePolicy.plan("BacklightTimeout", "3600", properties: idea) != nil, "timeout upper bound")
        for value in ["-1", "3601", "00", "1e2", " 3", "3; reboot"] { check(PanePolicy.plan("BacklightTimeout", value, properties: idea) == nil, "reject timeout \(value)") }
        check(PanePolicy.matches("DYTCMode", value: "Balanced", controls: ["DYTCMode": "Balance"], pane: PaneState(idea)) == true, "Balance read-back normalization")
        check(PanePolicy.matches("DYTCMode", value: "Balanced", controls: ["DYTCMode": "Balanced"], pane: PaneState(idea)) == true, "Balanced read-back normalization")
        check(PanePolicy.matches("RapidChargeMode", value: "true", controls: ["RapidChargeMode": "Off"], pane: PaneState(idea)) == false, "read-back mismatch")
        let think: [String: Any] = ["IOClass": "ThinkVPC", "LEDSupport": true, "AutoBacklight": 23, "BacklightLevel": 1, "BacklightTimeout": 30, "BAT_PRIMARY": ["BCTG": 40, "BCSG": 80], "BAT_SECONDARY": ["BCTG": 256 + 45, "BCSG": 256], "DYTC": ["Function Status": ["PSC": false]]]
        check(PaneState(think).thresholds(2)?.stop == 100, "ThinkPad 0 means stop at 100 percent")
        check(PaneState(think).thresholds(2)?.start == 45, "mask high capability bits")
        check(PanePolicy.plan("Thresholds", "1,40,80", properties: idea) == nil, "IdeaPad thresholds unavailable")
        for value in ["1,80,40", "1,0,0", "3,40,80", "1,,40,80", "1,garbage,40,80", "1,040,80", "1,40,101", "1,-1,80"] { check(PanePolicy.plan("Thresholds", value, properties: think) == nil, "reject threshold \(value)") }
        let increasing = PanePolicy.plan("Thresholds", "1,50,100", properties: think)!
        check(increasing.map(\.key) == ["Battery", "setCMstop", "setCMstart"], "write stop first when increasing")
        check((increasing[1].value as? NSNumber)?.intValue == 0, "encode 100 percent stop sentinel")
        check(PanePolicy.plan("Thresholds", "1,10,30", properties: think)!.map(\.key) == ["Battery", "setCMstart", "setCMstop"], "write start first when reducing below old start")
        var writes: [String] = []
        let result = PanePolicy.perform(increasing) { value in writes.append(value.key); return writes.count == 2 ? -1 : 0 }
        check(result == -1 && writes == ["Battery", "setCMstop"], "stop after first driver error")
        check(PanePolicy.plan("InspectBattery", "2", properties: think)?.first?.key == "Battery", "explicit battery selection")
        check(PanePolicy.plan("InspectBattery", "2", properties: idea) == nil, "no IdeaPad battery-index writes")
        check(PanePolicy.plan("LED", "10,3", properties: think)?.first?.value as? NSNumber == NSNumber(value: 0xca), "encode Think dot blink")
        check(PanePolicy.plan("LED", "16,1", properties: think) == nil, "LED upper bound")
        check(PanePolicy.plan("LED", "1,4", properties: think) == nil, "LED mode upper bound")
        check(PanePolicy.plan("LED", "1,0", properties: idea) == nil, "no IdeaPad LED writes")
        check(PanePolicy.matches("LED", value: "1,1", controls: [:], pane: PaneState(think)) == nil, "never claim unobservable LED confirmation")
        check(PanePolicy.plan("AutoBacklight", "31", properties: think) != nil, "automation mask valid")
        check(PanePolicy.plan("AutoBacklight", "32", properties: think) == nil, "automation mask invalid")
        check(PanePolicy.plan("BacklightLevel", "2", properties: think) != nil, "backlight highest supported pane level")
        check(PanePolicy.plan("BacklightLevel", "3", properties: think) == nil, "reject out of range backlight")
        check(PanePolicy.plan("DYTCPSCMode", "15", properties: think) != nil, "PSC inactive still supported")
        check(PanePolicy.plan("DYTCPSCMode", "0", properties: think) == nil, "reject wrong auto code")
        check(PanePolicy.matches("DYTCPSCMode", value: "2", controls: ["DYTCPSCMode": "1"], pane: PaneState(think)) == false, "numeric PSC mismatch is a failure")
        check(PanePolicy.matches("DYTCPSCMode", value: "15", controls: [:], pane: PaneState(think)) == nil, "unknown PSC state is not confirmed")
        for key in ["ReadEC", "WriteEC", "ReadECOffset", "ECLock", "FanSpeed", "reset", "SBMC", "SystemSerialNumber"] { check(PanePolicy.plan(key, "1", properties: think) == nil, "reject non-pane command \(key)") }
        var writeAttempts = 0; var authorizations = 0
        func execute(_ code: Int32, canAuthorize: Bool = true) -> String? {
            RequestErrors.execute(key: "ConservationMode", driverVersion: "REL-200-2026-11-13", canAuthorize: canAuthorize,
                write: { writeAttempts += 1; return code }, authorize: { authorizations += 1; return nil })
        }
        check(execute(RequestErrors.notPermitted)?.contains("2.0.1") == true, "old driver lock has actionable error")
        check(authorizations == 0 && writeAttempts == 1, "driver lock never triggers password dialog")
        check(execute(RequestErrors.notPrivileged) == nil && authorizations == 1, "privilege violation permits one authorization")
        check(execute(RequestErrors.notPrivileged, canAuthorize: false) != nil && authorizations == 1, "privileged helper does not recursively authorize")
        check(execute(0) == nil && authorizations == 1, "successful write needs no password")
        check(execute(RequestErrors.badArgument) != nil && authorizations == 1, "invalid request never prompts")
        check(execute(RequestErrors.unsupported) != nil && authorizations == 1, "unsupported request never prompts")
        check(execute(RequestErrors.ioError) != nil && authorizations == 1, "firmware failure never prompts")
        let denied = "IDEAVPC_AUTH_FAILURE=1\nIDEAVPC_WRITE_ERROR=-536870174 (1)"
        check(RequestErrors.authorizedResult(output: denied, terminationStatus: 0, key: "ConservationMode", driverVersion: "REL-200-2026-11-13")?.contains("driver lock") == true, "decode exact screenshot error after authorization")
        check(RequestErrors.authorizedResult(output: "IDEAVPC_AUTH_FAILURE=-128\nUser canceled.", terminationStatus: 0, key: "ConservationMode", driverVersion: "")?.contains("cancelled") == true, "authorization cancellation is distinct")
        check(RequestErrors.authorizedResult(output: "IDEAVPC_AUTH_OK\n", terminationStatus: 0, key: "ConservationMode", driverVersion: "") == nil, "helper success marker")
        check(RequestErrors.authorizedResult(output: "", terminationStatus: 1, key: "ConservationMode", driverVersion: "") != nil, "missing helper output is not success")
        check(RequestErrors.integer(after: RequestErrors.helperMarker, in: "IDEAVPC_WRITE_ERROR=bad") == nil, "malformed status rejected")
        print("PASS: \(checks) policy, capability, encoding and read-back checks; no hardware writes")
    }
}
