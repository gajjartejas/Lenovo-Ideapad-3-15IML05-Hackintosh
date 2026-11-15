import SwiftUI
import AppKit
import IOKit
import Charts

struct Detail: Identifiable, Sendable { let name: String; let value: String; var id: String { name } }
struct Snapshot: Sendable {
    var connected = false
    var pane = PaneState()
    var controls: [String: String] = [:]
    var battery: [Detail] = []
    var device: [Detail] = []
    var percent: Double?
    var health: Double?
    var watts: Double?
    var temperature: String?
    var cycles: String?
    var charging = false
    var adapter = false
    var updated = Date()
}
enum VPC {
    static let booleans = PanePolicy.booleanKeys
    static func properties(_ name: String) -> [String: Any] {
        let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching(name))
        guard service != 0 else { return [:] }
        defer { IOObjectRelease(service) }
        var result: Unmanaged<CFMutableDictionary>?
        guard IORegistryEntryCreateCFProperties(service, &result, kCFAllocatorDefault, 0) == KERN_SUCCESS else { return [:] }
        return result?.takeRetainedValue() as? [String: Any] ?? [:]
    }
    static func display(_ value: Any) -> String {
        if let n = value as? NSNumber {
            if CFGetTypeID(n) == CFBooleanGetTypeID() { return n.boolValue ? "On" : "Off" }
            return n.stringValue
        }
        return String(describing: value)
    }
    static func read() -> Snapshot {
        let p = properties("YogaVPC"), b = properties("AppleSmartBattery")
        var s = Snapshot(); s.connected = !p.isEmpty; s.pane = PaneState(p)
        for key in booleans + ["BacklightLevel", "BacklightTimeout", "AutoBacklight"] { if let v = p[key] { s.controls[key] = display(v) } }
        if let d = p["DYTC"] as? [String: Any] {
            s.controls["DYTCMode"] = d["PerfMode"].map(display)
            s.controls["DYTCPSCMode"] = PaneState.number(d["PerfMode"]).map(String.init)
            for k in ["FuncMode", "PerfMode", "Revision", "SubRevision"] { if let v = d[k] { s.device.append(Detail(name: "DYTC · \(k)", value: display(v))) } }
        }
        for k in ["VersionInfo", "EC Capability", "EC Access Retries", "EC Capability Reason", "EC Read Byte Method", "EC Read Buffer Method", "EC Write Byte Method", "PrimeKeyType", "BacklightLevel", "AlwaysOnUSBMode"] {
            if let v = p[k] { s.device.append(Detail(name: k, value: display(v))) }
        }
        if let d = p["Capability"] as? [String: Any] {
            for k in d.keys.sorted() { s.device.append(Detail(name: "Capability · \(k)", value: display(d[k]!))) }
        }
        let names: [(String,String,String)] = [("CurrentCapacity","Current capacity",""),("MaxCapacity","Full charge capacity",""),("DesignCapacity","Design capacity"," mAh"),("AppleRawCurrentCapacity","Raw current capacity"," mAh"),("AppleRawMaxCapacity","Raw full charge capacity"," mAh"),("CycleCount","Cycle count",""),("Voltage","Voltage"," mV"),("Amperage","Current"," mA"),("IsCharging","Charging",""),("ExternalConnected","Power adapter connected",""),("FullyCharged","Fully charged",""),("BatteryInstalled","Battery installed","")]
        for (key,label,unit) in names { if let v = b[key] { s.battery.append(Detail(name: label, value: display(v)+unit)) } }
        // Firmware-only summary; omit identifiers, serials and phantom second-battery data.
        if let extra = p["Battery 0"] as? [String: Any] {
            for k in ["Temperature", "Manufacture date", "Cycle count"] { if let v = extra[k] { s.battery.append(Detail(name: "Lenovo · \(k)", value: display(v))) } }
        }
        if let design = b["DesignCapacity"] as? NSNumber,
           let maximum = (b["AppleRawMaxCapacity"] ?? b["MaxCapacity"]) as? NSNumber,
           design.doubleValue > 0, maximum.doubleValue > 100 {
            s.battery.append(Detail(name: "Estimated capacity health", value: String(format: "%.0f%%", maximum.doubleValue/design.doubleValue*100)))
        }
        let current = (b["AppleRawCurrentCapacity"] ?? b["CurrentCapacity"]) as? NSNumber
        let full = (b["AppleRawMaxCapacity"] ?? b["MaxCapacity"]) as? NSNumber
        if let current, let full, full.doubleValue > 0 { s.percent = min(100, max(0, current.doubleValue / full.doubleValue * 100)) }
        if let design = b["DesignCapacity"] as? NSNumber, let full, design.doubleValue > 0, full.doubleValue > 100 { s.health = full.doubleValue / design.doubleValue * 100 }
        if let volts = b["Voltage"] as? NSNumber, let amps = b["Amperage"] as? NSNumber { s.watts = volts.doubleValue * Double(amps.int64Value) / 1_000_000 }
        s.cycles = b["CycleCount"].map(display)
        s.temperature = (p["Battery 0"] as? [String: Any])?["Temperature"].map(display)
        s.charging = (b["IsCharging"] as? NSNumber)?.boolValue ?? false
        s.adapter = (b["ExternalConnected"] as? NSNumber)?.boolValue ?? false
        return s
    }
    static func write(_ key: String, _ value: String) -> kern_return_t {
        let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching("YogaVPC"))
        guard service != 0 else { return kIOReturnNotFound }
        defer { IOObjectRelease(service) }
        var raw: Unmanaged<CFMutableDictionary>?
        guard IORegistryEntryCreateCFProperties(service, &raw, kCFAllocatorDefault, 0) == KERN_SUCCESS,
              let properties = raw?.takeRetainedValue() as? [String: Any],
              let plan = PanePolicy.plan(key, value, properties: properties) else { return kIOReturnBadArgument }
        return PanePolicy.perform(plan) { write in
            IORegistryEntrySetCFProperties(service, [write.key: write.value] as CFDictionary)
        }
    }
    static func shellQuote(_ s: String) -> String { "'" + s.replacingOccurrences(of: "'", with: "'\\''") + "'" }
    static func apply(_ key: String, _ value: String) -> String? {
        let version = properties("YogaVPC")["VersionInfo"] as? String ?? ""
        return RequestErrors.execute(key: key, driverVersion: version, canAuthorize: geteuid() != 0,
            write: { write(key, value) }, authorize: { authorize(key, value, driverVersion: version) })
    }
    private static func authorize(_ key: String, _ value: String, driverVersion: String) -> String? {
        let executable = Bundle.main.executablePath ?? CommandLine.arguments[0]
        let command = [executable, "--set", key, value].map(shellQuote).joined(separator: " ")
        let literal = command.replacingOccurrences(of: "\\", with: "\\\\").replacingOccurrences(of: "\"", with: "\\\"")
        let script = """
        try
            do shell script "\(literal)" with administrator privileges
            return "IDEAVPC_AUTH_OK"
        on error errorText number errorNumber
            return "IDEAVPC_AUTH_FAILURE=" & errorNumber & linefeed & errorText
        end try
        """
        let process = Process(); process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = ["-e", script]
        let output = Pipe(); let errors = Pipe()
        process.standardOutput = output; process.standardError = errors
        do { try process.run() } catch { return "Could not start administrator authorization: \(error.localizedDescription)" }
        let data = output.fileHandleForReading.readDataToEndOfFile()
        process.waitUntilExit()
        // osascript stderr is deliberately not shown as a raw execution-error alert.
        _ = errors.fileHandleForReading.readDataToEndOfFile()
        return RequestErrors.authorizedResult(output: String(data: data, encoding: .utf8) ?? "", terminationStatus: process.terminationStatus, key: key, driverVersion: driverVersion)
    }
}
struct HistoryPoint: Identifiable { let id = UUID(); let date: Date; let percent: Double?; let watts: Double? }
@MainActor final class Model: ObservableObject {
    @Published var state = Snapshot()
    @Published var diagnostics: [DiagnosticSection] = []
    @Published var diagnosticBusy = false
    @Published var efiPath = Diagnostics.defaultEFI()
    func refreshDiagnostics() async {
        guard !diagnosticBusy else { return }; diagnosticBusy = true
        let path = efiPath
        diagnostics = await Task.detached(priority: .utility) { Diagnostics.collect(configPath: path) }.value
        diagnosticBusy = false
    }
    func chooseEFI() {
        let panel = NSOpenPanel(); panel.canChooseDirectories = false; panel.allowsMultipleSelection = false
        panel.message = "Choose the config.plist to inspect. This app only reads it. It may differ from your boot EFI."
        if panel.runModal() == .OK, let url = panel.url {
            efiPath = url.path; UserDefaults.standard.set(efiPath, forKey: "EFIConfigPath")
            Task { await refreshDiagnostics() }
        }
    }
    @Published var history: [HistoryPoint] = []
    @Published var busy = false
    func record() {
        guard state.percent != nil || state.watts != nil else { return }
        history.append(HistoryPoint(date: state.updated, percent: state.percent, watts: state.watts))
        if history.count > 240 { history.removeFirst(history.count - 240) }
    }
    @Published var status = "Reading device…"
    @Published var error: String?
    func refresh() async {
        guard !busy else { return }
        busy = true
        state = await Task.detached(priority: .utility) { VPC.read() }.value
        record()
        status = state.connected ? "Updated \(state.updated.formatted(date: .omitted, time: .shortened))" : "IdeaVPC is unavailable. Enable YogaSMC in your boot EFI, then restart."
        busy = false
    }
    func set(_ key: String, _ value: String) {
        guard !busy else { return }; busy = true
        Task {
            let failure = await Task.detached(priority: .userInitiated) { VPC.apply(key, value) }.value
            try? await Task.sleep(for: .milliseconds(800))
            state = await Task.detached(priority: .utility) { VPC.read() }.value
            record()
            if let failure { error = failure }
            else if let matched = PanePolicy.matches(key, value: value, controls: state.controls, pane: state.pane) {
                if matched { status = "Driver reports requested value · \(state.updated.formatted(date: .omitted, time: .shortened))" }
                else { error = "The driver did not report the requested value. A multi-step change may be partial. Refresh before trying again." }
            } else { status = "Request sent · this driver does not publish a verifiable state for this control." }
            busy = false
        }
    }
}
struct ContentView: View {
    @ObservedObject var model: Model
    @ObservedObject var preferences: AppPreferences
    @Environment(\.scenePhase) private var phase
    @State private var selection = "Battery"
    @State private var chartMetric = "Charge"
    let timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
    private var chargeColor: Color { model.state.charging ? .green : .teal }
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                Label("Battery", systemImage: "battery.100percent").tag("Battery")
                Label("Controls", systemImage: "slider.horizontal.3").tag("Controls")
                Label("Pane settings", systemImage: "switch.2").tag("Pane settings")
                Label("App settings", systemImage: "gearshape").tag("App settings")
                Label("Device", systemImage: "laptopcomputer").tag("Device")
                Label("Diagnostics", systemImage: "stethoscope").tag("Diagnostics")
            }.navigationTitle("IdeaVPC").navigationSplitViewColumnWidth(min: 155, ideal: 175, max: 220)
            .safeAreaInset(edge: .bottom) {
                Label(model.state.connected ? model.state.pane.driver + " connected" : "Not connected", systemImage: model.state.connected ? "circle.fill" : "circle")
                    .font(.caption).foregroundStyle(.secondary).padding(16)
            }
        } detail: {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        if selection == "Battery" { batteryPage }
                        else if selection == "Controls" { controlsPage }
                        else if selection == "Diagnostics" { diagnosticsPage }
                        else if selection == "Pane settings" { PaneSettingsView(model: model) }
                        else if selection == "App settings" { AppSettingsView(preferences: preferences, model: model) }
                        else { devicePage }
                    }.padding(24).frame(maxWidth: 1000, alignment: .leading).frame(maxWidth: .infinity)
                }.background(Color(nsColor: .windowBackgroundColor))
                Divider()
                HStack(spacing: 8) {
                    Image(systemName: model.state.connected ? "checkmark.circle.fill" : "exclamationmark.circle").foregroundStyle(model.state.connected ? .green : .orange)
                    Text(model.status).font(.caption).foregroundStyle(.secondary)
                    Spacer()
                    if model.busy { ProgressView().controlSize(.small) }
                }.padding(12)
            }.navigationTitle(selection)
            .toolbar { Button { Task { if selection == "Diagnostics" { await model.refreshDiagnostics() } else { await model.refresh() } } } label: { Label("Refresh", systemImage: "arrow.clockwise") }.keyboardShortcut("r").disabled(model.busy) }
        }
        .frame(minWidth: 740, minHeight: 590)
        .task { await model.refresh() }
        .task(id: selection) { if selection == "Diagnostics", model.diagnostics.isEmpty { await model.refreshDiagnostics() } }
        .onReceive(timer) { _ in if phase == .active { Task { await model.refresh() } } }
        .alert("Setting wasn’t confirmed", isPresented: Binding(get: { model.error != nil }, set: { if !$0 { model.error = nil } })) { Button("OK") { model.error = nil } } message: { Text(model.error ?? "") }
    }
    var batteryPage: some View {
        VStack(alignment: .leading, spacing: 20) {
            GroupBox {
                HStack(spacing: 24) {
                    ZStack {
                        Circle().stroke(chargeColor.opacity(0.13), lineWidth: 10)
                        Circle().trim(from: 0, to: (model.state.percent ?? 0)/100).stroke(chargeColor, style: StrokeStyle(lineWidth: 10, lineCap: .round)).rotationEffect(.degrees(-90))
                        VStack(spacing: 3) {
                            Text(model.state.percent.map { String(format: "%.0f%%", $0) } ?? "—").font(.system(size: 30, weight: .semibold, design: .rounded)).monospacedDigit()
                            Image(systemName: model.state.charging ? "bolt.fill" : "battery.100percent").foregroundStyle(chargeColor)
                        }
                    }.frame(width: 116, height: 116).accessibilityElement(children: .ignore).accessibilityLabel("Battery charge").accessibilityValue(model.state.percent.map { String(format: "%.0f percent", $0) } ?? "Unavailable")
                    VStack(alignment: .leading, spacing: 8) {
                        Text(model.state.charging ? "Charging" : model.state.adapter ? "Connected to power" : "On battery").font(.title2.bold())
                        Label(model.state.adapter ? "Power adapter connected" : "Using battery power", systemImage: model.state.adapter ? "powerplug.fill" : "battery.75percent").foregroundStyle(.secondary)
                        Label(model.state.controls["ConservationMode"] == "On" ? "Conservation mode is on" : "Conservation mode is off", systemImage: "leaf.fill").font(.callout).foregroundStyle(model.state.controls["ConservationMode"] == "On" ? .green : .secondary)
                    }
                    Spacer(minLength: 0)
                }.padding(14)
            }
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                metric("Capacity health", value: model.state.health.map { String(format: "%.0f%%", $0) } ?? "—", symbol: "heart.fill", color: .pink)
                metric("Temperature", value: model.state.temperature ?? "—", symbol: "thermometer.medium", color: .orange)
                metric("Charge cycles", value: model.state.cycles ?? "—", symbol: "arrow.trianglehead.2.clockwise.rotate.90", color: .blue)
            }
            GroupBox {
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Label("Live battery history", systemImage: "chart.xyaxis.line").font(.headline)
                        Spacer()
                        Picker("Metric", selection: $chartMetric) { Text("Charge").tag("Charge"); Text("Power").tag("Power") }.pickerStyle(.segmented).labelsHidden().frame(width: 150).fixedSize(horizontal: true, vertical: false)
                    }
                    if model.history.isEmpty { ContentUnavailableView("Waiting for battery data", systemImage: "chart.xyaxis.line") }
                    else {
                        Chart(model.history) { point in
                            if let value = chartMetric == "Charge" ? point.percent : point.watts {
                                LineMark(x: .value("Time", point.date), y: .value(chartMetric, value)).foregroundStyle(chargeColor).lineStyle(StrokeStyle(lineWidth: 2.5))
                                PointMark(x: .value("Time", point.date), y: .value(chartMetric, value)).foregroundStyle(chargeColor).symbolSize(model.history.count == 1 ? 45 : 12)
                            }
                        }
                        .chartYScale(domain: chartMetric == "Charge" ? 0...100 : powerDomain)
                        .chartXAxis { AxisMarks(values: .automatic(desiredCount: 4)) { _ in AxisGridLine(); AxisValueLabel(format: .dateTime.hour().minute()) } }
                        .chartYAxisLabel(chartMetric == "Charge" ? "Charge (%)" : "Battery power (W)")
                        .frame(height: 170)
                        .accessibilityLabel("Recorded battery \(chartMetric.lowercased()) history for this session")
                    }
                    Text(model.history.count < 2 ? "History starts now. New readings appear every 15 seconds while the app is active." : "This session · \(model.history.count) readings · Positive power is charging; negative is discharging.")
                        .font(.caption).foregroundStyle(.secondary)
                }.padding(8)
            }
            detailCard("Battery details", symbol: "list.bullet.rectangle", rows: model.state.battery)
            footnote("Capacity health is an estimate. History is kept in memory for up to 240 readings and clears when you quit. Readings reflect the values published by the drivers.")
        }
    }
    var powerDomain: ClosedRange<Double> {
        let values = model.history.compactMap(\.watts)
        return min(-1, (values.min() ?? 0) - 1)...max(1, (values.max() ?? 0) + 1)
    }
    var controlsPage: some View {
        VStack(alignment: .leading, spacing: 20) {
            banner("Make your IdeaPad yours", subtitle: "Charging, keyboard and performance preferences.", symbol: "slider.horizontal.3", color: .indigo)
            GroupBox {
                VStack(spacing: 0) {
                    control("Conservation mode", key: "ConservationMode", subtitle: "Use Lenovo’s firmware charging limit.", symbol: "leaf.fill", color: .green)
                    Divider().padding(.leading, 58)
                    control("Rapid charging", key: "RapidChargeMode", subtitle: "Charge faster when supported by the firmware.", symbol: "bolt.fill", color: .orange)
                }
            } label: { Label("Battery charging", systemImage: "battery.100percent").font(.headline) }
            GroupBox {
                VStack(spacing: 0) {
                    control("Fn lock", key: "FnlockMode", subtitle: "Switch function-key behaviour.", symbol: "keyboard", color: .blue)
                    Divider().padding(.leading, 58)
                    settingInfo("Keyboard backlight", value: model.state.controls["BacklightLevel"]?.capitalized ?? "Unavailable", symbol: "light.max", color: .purple)
                }
            } label: { Label("Keyboard", systemImage: "keyboard").font(.headline) }
            GroupBox {
                VStack(spacing: 0) {
                    HStack(spacing: 12) {
                        badge("speedometer", color: .indigo)
                        VStack(alignment: .leading, spacing: 3) { Text("Performance mode"); Text("Lenovo thermal and power profile").font(.caption).foregroundStyle(.secondary) }
                        Spacer()
                        if let mode = model.state.controls["DYTCMode"] {
                            Picker("Performance mode", selection: Binding(get: { mode }, set: { model.set("DYTCMode", $0) })) {
                                ForEach(["Quiet", "Balanced", "Performance"], id: \.self) { Text($0).tag($0) }
                                if !["Quiet", "Balanced", "Performance"].contains(mode) { Text(mode).tag(mode) }
                            }.labelsHidden().frame(width: 145).disabled(model.busy || !model.state.pane.dytcFunctions.contains("MMC"))
                        } else { Text("Unavailable").foregroundStyle(.secondary) }
                    }.padding(12)
                    Divider().padding(.leading, 58)
                    control("Always-on USB", key: "AlwaysOnUSBMode", subtitle: "USB charging while the laptop sleeps.", symbol: "powerplug.fill", color: .teal)
                }
            } label: { Label("Performance & USB", systemImage: "cpu").font(.headline) }
            footnote("Changes apply immediately and are read back for confirmation. Unsupported features are unavailable. Lenovo firmware determines charging thresholds; rapid charging can interact with conservation mode.")
        }.disabled(!model.state.connected)
    }
    var diagnosticsPage: some View {
        VStack(alignment: .leading, spacing: 20) {
            banner("System diagnostics", subtitle: "Live drivers and ACPI effects on your IdeaPad.", symbol: "stethoscope", color: .teal)
            GroupBox {
                VStack(alignment: .leading, spacing: 10) {
                    HStack { Label("EFI reference", systemImage: "folder").font(.headline); Spacer(); Button("Choose config…") { model.chooseEFI() } }
                    Text(model.efiPath.isEmpty ? "No EFI reference selected" : model.efiPath).font(.caption).foregroundStyle(.secondary).textSelection(.enabled).lineLimit(3)
                    Text("EFI entries show configuration, not proof of loading. Live effects cannot confirm which AML filename supplied them. Driver attachment does not verify touchpad smoothness or brightness adjustment.").font(.caption).foregroundStyle(.secondary)
                }.padding(8)
            }
            if model.diagnosticBusy { HStack { ProgressView().controlSize(.small); Text("Reading system diagnostics…").foregroundStyle(.secondary) } }
            ForEach(model.diagnostics) { section in detailCard(section.title, symbol: section.symbol, rows: section.rows) }
            footnote("Diagnostics refresh on demand. No EFI, kext or ACPI changes are made. Codeless kexts do not appear in loaded-executable lists; missing entries are not automatically injection failures.")
        }
    }
    var devicePage: some View {
        VStack(alignment: .leading, spacing: 20) {
            banner("Lenovo " + (model.state.pane.isThink ? "ThinkPad" : "IdeaPad"), subtitle: model.state.connected ? model.state.pane.driver + " is connected through YogaSMC." : "Waiting for the IdeaVPC service.", symbol: "laptopcomputer", color: .blue)
            HStack(spacing: 12) {
                metric("Driver", value: model.state.connected ? "Connected" : "Offline", symbol: "checkmark.shield.fill", color: model.state.connected ? .green : .orange)
                metric("EC access", value: model.state.device.first { $0.name == "EC Capability" }?.value ?? "—", symbol: "cpu", color: .purple)
            }
            let capabilities = model.state.device.filter { $0.name.hasPrefix("Capability · ") }
            GroupBox {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .leading, spacing: 14) {
                    ForEach(capabilities) { row in
                        HStack(spacing: 10) {
                            Image(systemName: icon(row.name)).foregroundStyle(row.value == "Off" ? Color.secondary : .blue).frame(width: 20)
                            Text(row.name.replacingOccurrences(of: "Capability · ", with: ""))
                            Spacer()
                            Text(row.value == "On" ? "Present" : row.value == "Off" ? "Not present" : row.value).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }.padding(10)
            } label: { Label("Firmware capabilities", systemImage: "square.grid.2x2").font(.headline) }
            detailCard("Driver & firmware", symbol: "info.circle", rows: model.state.device.filter { !$0.name.hasPrefix("Capability · ") })
            footnote("Capability flags describe firmware features. They do not independently verify device operation. Unsupported controls remain unavailable.")
        }
    }
    func icon(_ text: String) -> String {
        let t = text.lowercased()
        if t.contains("temperature") { return "thermometer.medium" }
        if t.contains("cycle") { return "arrow.trianglehead.2.clockwise.rotate.90" }
        if t.contains("health") { return "heart" }
        if t.contains("voltage") || t.contains("current") { return "bolt" }
        if t.contains("adapter") || t.contains("usb") { return "powerplug" }
        if t.contains("date") { return "calendar" }
        if t.contains("bluetooth") { return "antenna.radiowaves.left.and.right" }
        if t.contains("wireless") { return "wifi" }
        if t.contains("camera") { return "camera" }
        if t.contains("touchpad") { return "rectangle.and.hand.point.up.left" }
        if t.contains("graphics") { return "display" }
        if t.contains("dytc") { return "speedometer" }
        if t.contains("ec ") || t.contains("version") { return "cpu" }
        return "battery.100percent"
    }
    func badge(_ symbol: String, color: Color) -> some View {
        Image(systemName: symbol).font(.system(size: 18, weight: .medium)).foregroundStyle(color).frame(width: 36, height: 36).background(color.opacity(0.12), in: RoundedRectangle(cornerRadius: 10))
    }
    func metric(_ title: String, value: String, symbol: String, color: Color) -> some View {
        GroupBox {
            VStack(alignment: .leading, spacing: 10) {
                HStack { badge(symbol, color: color); Spacer(minLength: 0) }
                Text(value).font(.system(.title2, design: .rounded, weight: .semibold)).monospacedDigit()
                Text(title).font(.caption).foregroundStyle(.secondary)
            }.padding(8).frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    func banner(_ title: String, subtitle: String, symbol: String, color: Color) -> some View {
        HStack(spacing: 16) {
            Image(systemName: symbol).font(.system(size: 32)).foregroundStyle(color).frame(width: 64, height: 64).background(color.opacity(0.10), in: RoundedRectangle(cornerRadius: 17))
            VStack(alignment: .leading, spacing: 5) { Text(title).font(.title2.bold()); Text(subtitle).foregroundStyle(.secondary) }
            Spacer(minLength: 0)
        }.padding(.vertical, 4)
    }
    func detailCard(_ title: String, symbol: String, rows: [Detail]) -> some View {
        GroupBox {
            VStack(spacing: 0) {
                if rows.isEmpty { Text("No information available").foregroundStyle(.secondary).padding() }
                ForEach(Array(rows.enumerated()), id: \.element.id) { index, row in
                    HStack(spacing: 10) {
                        Image(systemName: icon(row.name)).foregroundStyle(.secondary).frame(width: 20)
                        Text(row.name)
                        Spacer()
                        Text(row.value.capitalized == "Unsupported" ? "Unsupported" : row.value).foregroundStyle(.secondary).textSelection(.enabled).multilineTextAlignment(.trailing)
                    }.padding(.vertical, 10).padding(.horizontal, 8)
                    if index < rows.count - 1 { Divider().padding(.leading, 38) }
                }
            }.padding(4)
        } label: { Label(title, systemImage: symbol).font(.headline) }
    }
    func footnote(_ text: String) -> some View { Text(text).font(.caption).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true) }
    func settingInfo(_ title: String, value: String, symbol: String, color: Color) -> some View {
        HStack(spacing: 12) { badge(symbol, color: color); Text(title); Spacer(); Text(value).foregroundStyle(.secondary) }.padding(12)
    }
    @ViewBuilder func control(_ title: String, key: String, subtitle: String, symbol: String, color: Color) -> some View {
        let value = model.state.controls[key]
        HStack(spacing: 12) {
            badge(symbol, color: color)
            VStack(alignment: .leading, spacing: 3) { Text(title); Text(subtitle).font(.caption).foregroundStyle(.secondary) }
            Spacer()
            if value == "On" || value == "Off" {
                Toggle(title, isOn: Binding(get: { value == "On" }, set: { model.set(key, $0 ? "true" : "false") })).labelsHidden().toggleStyle(.switch).disabled(model.busy)
            } else { Text(value?.capitalized ?? "Unavailable").foregroundStyle(.secondary).font(.callout) }
        }.padding(12)
    }
}
@main struct IdeaVPCApp: App {
    init() {
        if CommandLine.arguments.count == 4 && CommandLine.arguments[1] == "--set" {
            let result = VPC.write(CommandLine.arguments[2], CommandLine.arguments[3]); if result != KERN_SUCCESS { fputs("\(RequestErrors.helperMarker)\(result)\n", stderr) }; exit(result == KERN_SUCCESS ? 0 : 1)
        }
        if CommandLine.arguments.contains("--diagnostics") {
            for section in Diagnostics.collect(configPath: Diagnostics.defaultEFI()) {
                print(section.title)
                for row in section.rows { print("  \(row.name): \(row.value)") }
            }
            exit(0)
        }
        if CommandLine.arguments.contains("--diagnose") {
            let s = VPC.read(); print("IdeaVPC connected: \(s.connected)\nControls: \(s.controls)\nBattery rows: \(s.battery.count)\nDevice rows: \(s.device.count)"); exit(s.connected ? 0 : 1)
        }
    }
    @StateObject private var model = Model()
    @StateObject private var preferences = AppPreferences()
    var body: some Scene {
        WindowGroup(id: "main") { ContentView(model: model, preferences: preferences) }.defaultSize(width: 880, height: 760)
        .commands { CommandGroup(replacing: .newItem) {} }
        MenuBarExtra(isInserted: Binding(get: { preferences.showMenu }, set: { inserted in
            // AppKit may echo the current value during scene reconciliation.
            // Ignore that echo and defer real changes out of the view update.
            guard inserted != preferences.showMenu else { return }
            Task { @MainActor in
                if inserted != preferences.showMenu { preferences.showMenu = inserted }
            }
        })) {
            CompanionMenu(model: model, preferences: preferences)
        } label: {
            if preferences.menuTitle.isEmpty { Image(systemName: "laptopcomputer") }
            else { Text(preferences.menuTitle) }
        }


    }
}
