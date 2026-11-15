# Validation — IdeaVPC 1.1 build 4

November 13, 2026. All changes are local to Tools; no driver or legacy preference-pane source was edited by this task.

| Check | Result |
| --- | --- |
| Optimized standalone Swift build | PASS |
| Strict/deep ad-hoc code signature verification | PASS |
| Request policy tests with AddressSanitizer | PASS, 58 checks |
| Live read-only diagnostic command | PASS: IdeaVPC connected, 16 battery rows, 16 device rows |
| Battery and existing Controls UI | Inspected; existing charging/Fn/performance information retained |
| Pane settings UI, including lower sections | Inspected; unsupported hardware controls disabled and battery ID hidden |
| App settings UI | Inspected; native settings and optional YogaSMCNC integration distinguished |
| Fresh screenshots | Captured and compressed as indexed PNGs |
| Firmware-changing controls / administrator elevation | Not exercised |
| ThinkPad/PSC/threshold/LED hardware | Not available on this IdeaPad; mock and compile coverage only |
| YogaSMCNC save/reload/reset actions | Not invoked against user preferences/apps |
| Native menu/Caps Lock activation | Controls inspected; Caps Lock and preference state not changed during QA |

A menu-bar binding initially published changes during SwiftUI scene reconciliation, causing an update loop. The corrected binding ignores same-value echoes and defers actual changes to the main actor after reconciliation. The rebuilt app launched responsively and both new pages were inspected afterward.

Policy tests cover boolean/numeric capability distinctions, unsupported properties, malformed/out-of-range inputs, corrected DYTCMode dispatch, inactive-but-supported DYTC functions, Balance/Balanced normalization, PSC automatic encoding, ThinkPad threshold support bits and 100% sentinel, write order and early stop on partial failure, LED encoding and bounds, and rejected raw commands. They issue no IOKit writes.

IORegistry read-back can reflect cached driver state. The UI does not claim physical LED or unknown PSC state confirmation. Build and tests do not establish firmware behaviour on untested hardware. The app is ad-hoc signed, not notarized. No release, install, EFI change, firmware write or upstream push is part of this update.

## November 14 correction: conservation and authorization

The earlier hardware-free tests missed the lock regression because their mock started with the automatic-control lock disabled. The mock now uses the production default, tests explicit manual conservation changes with the lock set, and asserts that this does not unlock automatic SMC writes. The failed manual-path guard is removed in development driver 2.0.1.

IdeaVPC 1.1.1 build 5 distinguishes NotPermitted from NotPrivileged and parses authorization/helper outcomes. Current app checks: 71 ASan-backed policy/error checks. No live write or password dialog is exercised. The loaded driver at diagnosis is REL-200-2026-11-13; it is not replaced by building these artifacts.
