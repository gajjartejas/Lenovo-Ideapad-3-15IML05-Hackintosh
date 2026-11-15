// SPDX-License-Identifier: GPL-2.0-only
import SwiftUI
import AppKit

struct PaneSettingsView: View {
    @ObservedObject var model: Model
    @State private var timeout = 30
    @State private var battery = 0
    @State private var start = 40
    @State private var stop = 80
    @State private var led = 0
    @State private var ledMode = 1
    @State private var psc = 15
    @State private var revealID = false
    private var pane: PaneState { model.state.pane }
    private let ledNames = ["Power", "Battery orange", "Battery green", "Dock active", "Bay active", "Dock battery", "Fn lock", "Standby", "Dock status 1", "Dock status 2", "Think dot", "LED 11", "ThinkVantage", "Caps Lock", "Microphone mute", "LED 15"]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label("YogaSMC pane controls", systemImage: "switch.2").font(.title2.bold())
            Text("Controls appear when the connected driver publishes the required capability. Changes are sent only when you use a control.").foregroundStyle(.secondary)
            GroupBox("Keyboard backlight") {
                VStack(alignment: .leading, spacing: 14) {
                    if let level = pane.numbers["BacklightLevel"] {
                        Picker("Brightness", selection: Binding(get: { level }, set: { model.set("BacklightLevel", String($0)) })) {
                            Text("Off").tag(0); Text("Low").tag(1); Text("High").tag(2)
                        }.pickerStyle(.segmented)
                    } else { unavailable("Keyboard backlight brightness") }
                    HStack {
                        Text("Turn off after")
                        TextField("Seconds", value: $timeout, format: .number).frame(width: 65)
                        Text("seconds (0 = never)").foregroundStyle(.secondary)
                        Spacer()
                        Button("Apply timeout") { model.set("BacklightTimeout", String(timeout)) }
                            .disabled(pane.numbers["BacklightTimeout"] == nil || !(0...3600).contains(timeout))
                    }
                    if let bits = pane.numbers["AutoBacklight"] {
                        Divider()
                        Text("Automatic backlight and indicators").font(.headline)
                        ForEach(Array(["Turn off keyboard backlight during sleep", "Turn off keyboard backlight in tablet mode", "Update system sleep indicator", "Update speaker mute LED", "Update microphone mute LED"].enumerated()), id: \.offset) { index, title in
                            Toggle(title, isOn: Binding(get: { bits & (1 << index) != 0 }, set: { on in
                                model.set("AutoBacklight", String(on ? bits | (1 << index) : bits & ~(1 << index)))
                            }))
                        }
                    } else { unavailable("Automatic backlight and indicators") }
                }.padding(10)
            }
            GroupBox("Power and thermal behaviour") {
                VStack(alignment: .leading, spacing: 14) {
                    if let current = pane.booleans["ClamshellMode"] {
                        Toggle("Clamshell mode", isOn: Binding(get: { current }, set: { model.set("ClamshellMode", $0 ? "true" : "false") }))
                        Text("Requires the firmware/ACPI clamshell methods. This controls YogaSMC behaviour, not macOS lid-sleep policy.").font(.caption).foregroundStyle(.secondary)
                    } else { unavailable("Clamshell mode · required ACPI methods are not published") }
                    Divider()
                    HStack {
                        Picker("DYTC PSC profile", selection: $psc) {
                            Text("Automatic / Balance").tag(15)
                            ForEach(1...8, id: \.self) { Text("Profile \($0)").tag($0) }
                        }
                        Button("Apply PSC") { model.set("DYTCPSCMode", String(psc)) }
                    }.disabled(!pane.dytcFunctions.contains("PSC"))
                    Text(pane.dytcFunctions.contains("PSC") ? "Firmware defines PSC profile meanings. Named performance modes remain on the Controls page." : "PSC is unavailable; this firmware reports no PSC capability.").font(.caption).foregroundStyle(.secondary)
                }.padding(10)
            }
            GroupBox("ThinkPad charging thresholds") {
                VStack(alignment: .leading, spacing: 12) {
                    Picker("Battery", selection: $battery) {
                        Text("Any battery").tag(0); Text("Primary").tag(1); Text("Secondary").tag(2)
                    }.onChange(of: battery) { _, _ in loadThresholds() }
                    Button("Read selected battery") { model.set("InspectBattery", String(battery)) }.disabled(!pane.isThink)
                    if let actual = pane.thresholds(battery) {
                        Text("Driver reports \(actual.start)% start / \(actual.stop)% stop").font(.caption).foregroundStyle(.secondary)
                        HStack {
                            TextField("Start %", value: $start, format: .number)
                            TextField("Stop %", value: $stop, format: .number)
                            Button("Apply thresholds") { model.set("Thresholds", "\(battery),\(start),\(stop)") }
                                .disabled(!(0...99).contains(start) || !(1...100).contains(stop) || start >= stop)
                        }
                    } else { unavailable(pane.isThink ? "No threshold data for this battery. The driver must publish its battery dictionary first." : "ThinkPad only · IdeaPad charging thresholds are firmware-defined") }
                    Text("Multiple writes can partly succeed. The app re-reads both thresholds; refresh before retrying a failed change.").font(.caption).foregroundStyle(.secondary)
                }.padding(10)
            }.disabled(!pane.isThink)
            GroupBox("ThinkPad LEDs") {
                VStack(alignment: .leading, spacing: 12) {
                    Picker("Indicator", selection: $led) { ForEach(0..<ledNames.count, id: \.self) { Text(ledNames[$0]).tag($0) } }
                    Picker("Mode", selection: $ledMode) { Text("Off").tag(0); Text("On").tag(1); Text("Pulse").tag(2); Text("Blink").tag(3) }.pickerStyle(.segmented)
                    Button("Apply LED") { model.set("LED", "\(led),\(ledMode)") }.disabled(!pane.isThink || pane.booleans["LEDSupport"] != true)
                    Text("Power (0), standby (7), Think dot (10), and all custom indicators from YogaSMCPane. The driver does not report LED state, so a successful request cannot confirm the physical light.").font(.caption).foregroundStyle(.secondary)
                }.padding(10)
            }.disabled(!pane.isThink || pane.booleans["LEDSupport"] != true)
            GroupBox("Additional battery information") {
                VStack(alignment: .leading, spacing: 10) {
                    Toggle("Show firmware battery ID locally", isOn: $revealID)
                    if revealID { Text(pane.batteryID ?? "Unavailable").font(.system(.body, design: .monospaced)).textSelection(.enabled) }
                    Text("Hidden by default and excluded from diagnostics output and screenshots.").font(.caption).foregroundStyle(.secondary)
                }.padding(10)
            }
            if let reason = pane.ecReason { Label(reason, systemImage: "info.circle").font(.callout).foregroundStyle(.secondary) }
        }
        .disabled(model.busy || !model.state.connected)
        .onAppear { timeout = pane.numbers["BacklightTimeout"] ?? 30; loadThresholds() }
    }
    private func loadThresholds() { if let current = pane.thresholds(battery) { start = current.start; stop = current.stop } }
    private func unavailable(_ text: String) -> some View { Label(text, systemImage: "minus.circle").foregroundStyle(.secondary) }
}

@MainActor final class AppPreferences: ObservableObject {
    private let defaults: UserDefaults
    @Published var showMenu: Bool { didSet { defaults.set(showMenu, forKey: "ShowCompanionMenu") } }
    @Published var menuTitle: String { didSet { defaults.set(menuTitle, forKey: "CompanionMenuTitle") } }
    @Published var showCaps: Bool { didSet { defaults.set(showCaps, forKey: "ShowCapsIndicator") } }
    private var capsTimer: Timer?
    private var lastCaps = false
    private var panel: NSPanel?
    init(defaults: UserDefaults = .standard, monitor: Bool = true) {
        self.defaults = defaults
        showMenu = defaults.bool(forKey: "ShowCompanionMenu")
        menuTitle = defaults.string(forKey: "CompanionMenuTitle") ?? ""
        showCaps = defaults.bool(forKey: "ShowCapsIndicator")
        lastCaps = NSEvent.modifierFlags.contains(.capsLock)
        if monitor {
            capsTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [weak self] _ in
                Task { @MainActor in self?.pollCaps() }
            }
        }
    }
    private func pollCaps() {
        let current = NSEvent.modifierFlags.contains(.capsLock)
        guard current != lastCaps else { return }; lastCaps = current
        guard showCaps, let screen = NSScreen.main else { return }
        panel?.orderOut(nil)
        let p = NSPanel(contentRect: NSRect(x: screen.visibleFrame.midX - 110, y: screen.visibleFrame.minY + 90, width: 220, height: 70), styleMask: [.borderless, .nonactivatingPanel], backing: .buffered, defer: false)
        p.level = .floating; p.isOpaque = false; p.backgroundColor = .clear; p.ignoresMouseEvents = true
        p.contentView = NSHostingView(rootView: Label(current ? "Caps Lock on" : "Caps Lock off", systemImage: "capslock.fill").font(.headline).frame(width: 220, height: 70).background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16)))
        p.orderFrontRegardless(); panel = p
        Task { @MainActor [weak p] in try? await Task.sleep(for: .seconds(1.5)); p?.orderOut(nil) }
    }
}
struct CompanionMenu: View {
    @ObservedObject var model: Model
    @ObservedObject var preferences: AppPreferences
    @Environment(\.openWindow) private var openWindow
    var body: some View {
        Text(model.state.pane.driver)
        Text(model.state.percent.map { String(format: "Battery %.0f%%", $0) } ?? "Battery unavailable")
        Button("Open IdeaVPC") { openWindow(id: "main"); NSApp.activate(ignoringOtherApps: true) }
        Button("Refresh battery") { Task { await model.refresh() } }
        Divider()
        Button("Hide menu icon") { preferences.showMenu = false }
        Button("Quit IdeaVPC") { NSApp.terminate(nil) }
    }
}

struct AppSettingsView: View {
    @ObservedObject var preferences: AppPreferences
    @ObservedObject var model: Model
    @State private var ncValues: [String: Bool] = [:]
    @State private var ncTitle = ""
    @State private var message = ""
    @State private var resetEvents = false
    private let nc = UserDefaults(suiteName: "org.zhen.YogaSMC")!
    private let flags: [(String, String)] = [("HideIcon", "Hide YogaSMCNC menu icon"), ("HideCapsLock", "Hide YogaSMCNC Caps Lock indicator"), ("SecondThinkFan", "Enable secondary ThinkPad fan"), ("AllowFanStop", "Allow ThinkPad fan stop"), ("DisableFan", "Hide ThinkPad fan controls"), ("SaveFanLevel", "Save and restore ThinkPad fan level"), ("ThinkMuteLEDFixup", "ThinkPad mute LED fixup")]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label("App and notification settings", systemImage: "gearshape").font(.title2.bold())
            GroupBox("Standalone companion") {
                VStack(alignment: .leading, spacing: 14) {
                    Toggle("Show IdeaVPC in the menu bar", isOn: $preferences.showMenu)
                    TextField("Custom menu title (empty = laptop icon)", text: $preferences.menuTitle)
                    Toggle("Show Caps Lock indicator", isOn: $preferences.showCaps)
                    Text("These settings are handled by IdeaVPC itself. No helper, accessibility permission or legacy preference pane is required.").font(.caption).foregroundStyle(.secondary)
                }.padding(10)
            }
            GroupBox("Optional YogaSMCNC compatibility") {
                VStack(alignment: .leading, spacing: 12) {
                    Text("The remaining pane settings configure the separate YogaSMCNC event/fan app. They are included here so you can retire the legacy preference pane. Saving them does not install or start YogaSMCNC, and does not send a firmware command.").foregroundStyle(.secondary)
                    ForEach(flags, id: \.0) { key, label in
                        Toggle(label, isOn: Binding(get: { ncValues[key] ?? false }, set: { ncValues[key] = $0 }))
                            .disabled(key.contains("Fan") || key == "ThinkMuteLEDFixup" ? !model.state.pane.isThink : false)
                    }
                    TextField("YogaSMCNC custom menu title", text: $ncTitle)
                    HStack {
                        Button("Save YogaSMCNC preferences") { saveNC() }
                        Button("Reload YogaSMCNC") { reloadNC() }
                        Button("Reset event customizations…", role: .destructive) { resetEvents = true }
                    }
                    Text(message).font(.caption).foregroundStyle(.secondary).textSelection(.enabled)
                    Text("Fan options apply only to supported ThinkPads running YogaSMCNC; they are unavailable on this IdeaPad. Save first, then reload explicitly. No automatic fan writes are added to IdeaVPC.").font(.caption).foregroundStyle(.secondary)
                }.padding(10)
            }
        }.onAppear { for (key, _) in flags { ncValues[key] = nc.bool(forKey: key) }; ncTitle = nc.string(forKey: "Title") ?? "" }
        .confirmationDialog("Reset YogaSMCNC event customizations?", isPresented: $resetEvents) {
            Button("Back up and reset events", role: .destructive) { backupAndReset() }
        } message: { Text("YogaSMCNC will quit first so it cannot save old mappings over the reset. Its Events preference is backed up locally before removal. Reload it explicitly afterward.") }
    }
    private func saveNC() {
        for (key, _) in flags where !(key.contains("Fan") || key == "ThinkMuteLEDFixup") || model.state.pane.isThink { nc.set(ncValues[key] ?? false, forKey: key) }
        if ncTitle.isEmpty { nc.removeObject(forKey: "Title") } else { nc.set(ncTitle, forKey: "Title") }
        message = "Preferences saved. Reload YogaSMCNC to apply them."
    }
    private func reloadNC() {
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: "org.zhen.YogaSMCNC") else { message = "YogaSMCNC is not installed. IdeaVPC’s own menu and Caps Lock indicator work independently."; return }
        let running = NSRunningApplication.runningApplications(withBundleIdentifier: "org.zhen.YogaSMCNC")
        for app in running { _ = app.terminate() }
        Task { @MainActor in
            for _ in 0..<30 where running.contains(where: { !$0.isTerminated }) { try? await Task.sleep(for: .milliseconds(100)) }
            guard running.allSatisfy(\.isTerminated) else { message = "YogaSMCNC has not quit. Reload was cancelled."; return }
            do { _ = try await NSWorkspace.shared.openApplication(at: url, configuration: .init()); message = "YogaSMCNC opened." }
            catch { message = error.localizedDescription }
        }
    }
    private func backupAndReset() {
        // YogaSMCNC saves Events on termination. Quit before removing the key,
        // otherwise a later reload would overwrite the reset with stale events.
        let running = NSRunningApplication.runningApplications(withBundleIdentifier: "org.zhen.YogaSMCNC")
        for app in running { _ = app.terminate() }
        Task { @MainActor in
            for _ in 0..<30 where running.contains(where: { !$0.isTerminated }) { try? await Task.sleep(for: .milliseconds(100)) }
            guard running.allSatisfy(\.isTerminated) else { message = "Reset cancelled: YogaSMCNC has not quit. No preferences removed."; return }
            do {
                if let old = nc.object(forKey: "Events") {
                    let folder = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("IdeaVPC/EventBackups", isDirectory: true)
                    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
                    let url = folder.appendingPathComponent("Events-\(UUID().uuidString).plist")
                    try PropertyListSerialization.data(fromPropertyList: old, format: .xml, options: 0).write(to: url, options: .atomic)
                    nc.removeObject(forKey: "Events"); message = "Events reset. Backup: \(url.path). Reload YogaSMCNC to apply."
                } else { message = "No custom Events preference exists; nothing was removed. Reload YogaSMCNC if needed." }
            } catch { message = "Reset cancelled: \(error.localizedDescription)" }
        }
    }
}
