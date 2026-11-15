# Conservation mode: YogaSMC 2.0.0 regression

The local 2.0.0 hardening build (`REL-200-2026-11-13`) accidentally returned `kIOReturnNotPermitted` (`0xE00002E2`, decimal `-536870174`) for explicit conservation-mode changes while `conservationModeLock` was true. This flag starts true upstream and gates automatic SMC requests during startup. The legacy manual setting path did not apply it.

This matches the observed failure after administrator authorization: elevation does not clear a driver-owned state flag. It is separate from a genuine `kIOReturnNotPrivileged` permission check.

## Correction

`0001-fix-manual-conservation-lock.patch` removes the accidental manual-path guard and bumps the development driver version to **2.0.1**. It does not clear the flag, change the automatic SMC callback's lock check, expose raw EC writes, or modify YogaSMCPane. The charging request still validates types and capabilities, performs the existing firmware operation, reads the state back and reports errors.

The patch is incremental against the previous local hardening work in `/Users/tejas/Desktop/GitHub/YogaSMC`, not against untouched upstream master. Its source branch is `codex/ideapad-ec-robustness`.

The app correction is **IdeaVPC 1.1.1 build 5**. It prompts at most once for a genuine privilege violation, never for `NotPermitted`. Helper results are decoded into readable messages instead of exposing an `osascript execution error` wrapper. The known 2.0.0 lock error identifies the required driver upgrade; cancellation remains distinct from a driver refusal.

## Build and test

- Kernel regressions extract and compile the production functions against hardware-free mocks with ASan/UBSan in Debug and Release modes. The mock now mirrors the production `conservationModeLock = true` default, verifying manual changes succeed without clearing that flag and repeated requests are no-ops.
- Swift request tests include the exact reported decimal error, no authorization for driver refusals, one authorization for a privilege violation, no recursive root authorization, cancellation, helper success/failure parsing, and malformed status handling.
- Build commands and dependency revisions for the development kext are in the separate clone's `LOCAL_CHANGES.md`.
- Live checks only read driver version/properties. No charging setting, EFI file, SIP setting or loaded kext is changed during this task.

## Using the correction

An app update alone cannot fix the lock in an already loaded 2.0.0 kext. The corrected **2.0.1 YogaSMC.kext** must replace that development kext in the EFI actually used to boot, followed by a reboot. Keep a backup of the working EFI and a recovery boot option. This task prepares the corrected artifacts but does not install a kext, change EFI, or reboot the machine. Runtime firmware behaviour after installing the corrected kext has not been tested here.
