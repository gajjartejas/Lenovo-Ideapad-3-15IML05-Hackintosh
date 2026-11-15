# YogaSMCPane feature map

Source reference: zhen-zen/YogaSMC commit `299907b359c4d323e8c45ecc91e88c2a87b6082d`. No YogaSMC or legacy preference-pane files are modified by this update. UI code, policy, tests, icon and build script live in this directory.

| Legacy pane feature | Standalone location / behaviour |
| --- | --- |
| Driver version, class and EC capability | Device page; includes optional detailed EC capability reason/method flags from newer drivers |
| IdeaPad conservation, rapid charge, Fn lock, always-on USB | Existing Controls page retained; capability/type checks applied before writes |
| Battery temperature, cycles and manufacture date | Existing Battery page retained |
| Firmware battery ID | Pane settings: opt-in local display; never included in diagnostic output |
| Camera, Bluetooth, wireless, WWAN, graphics capabilities | Existing Device page retained |
| DYTC MMC modes | Existing Controls page; corrected property name to `DYTCMode`; recognizes Balance/Balanced read-back |
| DYTC PSC selection | Pane settings; profiles 1–8 and automatic/Balance (wire value 15); enabled only if PSC is present in the function-capability dictionary |
| Backlight brightness | Pane settings: off/low/high; only when the driver publishes a numeric level |
| Backlight timeout | Pane settings: 0–3600 seconds, explicit Apply; 0 disables timeout |
| Sleep/tablet/indicator/speaker-mute/mic-mute automation | Pane settings: five-bit AutoBacklight mask, preserving unrelated bits |
| Clamshell mode | Pane settings, only if the driver publishes a boolean; does not claim to change macOS lid policy |
| ThinkPad any/primary/secondary battery thresholds | Pane settings; explicit Read selected battery; start < stop validation; 100% stop encoded as zero; choose a non-conflicting write order; stop on first error and re-read both values |
| Power, standby, Think dot and custom LEDs | Pane settings: all 16 identifiers, off/on/pulse/blink; requires ThinkVPC + LEDSupport; no false physical-state confirmation |
| Menu icon visibility and custom title | App settings: native IdeaVPC menu and optional YogaSMCNC shared preferences |
| Caps Lock indicator visibility | App settings: native opt-in IdeaVPC indicator and separate YogaSMCNC compatibility setting |
| Reset custom event mappings | App settings: quit YogaSMCNC to prevent stale save-on-exit, then back up its Events preference before explicit reset; reload separately |
| Secondary fan, allow fan stop, hide fan controls, remember fan level, mute LED fixup | App settings: optional YogaSMCNC compatibility preferences, enabled only for ThinkVPC. These are settings for that separate event/fan app, not a newly ported fan controller. They do not add raw EC writes or automatic hardware changes to IdeaVPC. |
| Apply notification preference changes | Explicit Save and Reload buttons, using native app lifecycle APIs; no shell script execution or implicit restart |

Unsupported controls display their reason and cannot issue requests. A false DYTC function status means inactive, not absent: dictionary membership determines capability. Shared YogaSMCNC preferences are loaded without mutation; only an explicit save/reset writes them. Existing installations of YogaSMCNC remain optional; the standalone menu and Caps Lock indicator do not depend on it. The YogaSMCNC event actuator, scripts, fan engine and its arbitrary event actions are separate software, not part of YogaSMCPane, and are not silently bundled.

## Verification boundaries

- Request policy tests run against the actual Foundation-only production module with AddressSanitizer. They cover capabilities, numeric/boolean type distinctions, ranges, malformed input, named/PSC thermal modes, thresholds/sentinels/write ordering, partial failures, LED encoding, read-back and rejected raw commands.
- Startup, diagnostic mode and UI inspection are read-only with respect to hardware. No setting, LED, fan, threshold, Caps Lock state, external preference or helper lifecycle is changed for testing.
- ThinkPad/PSC/LED/threshold hardware is not present on this IdeaPad. Those paths are mock-tested and compile-tested; they are not advertised as hardware-verified.
- Registry read-back reports driver-published state, which can be cached. For LED and nonnumeric PSC responses, the UI explicitly says the request was sent without claiming verification.
