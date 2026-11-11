---
name: hackintosh-update-and-release
description: >-
  Use this skill to update a Hackintosh repository for a new macOS or OpenCore release,
  sanitize and extract EFI archives without serials, update documentation (README, guides, screenshots),
  manage git branches, pull requests, issue triage, and publish GitHub releases.
---

# Hackintosh Repository Update & Release Workflow

This skill guides the agent through the complete, end-to-end process of updating a Hackintosh repository when supporting a new macOS version or OpenCore release. It covers environment inspection, EFI sanitization, documentation updates, Git branch management, PR review, issue triage, and publishing official GitHub releases.

---

## 1. System & Environment Inspection

If executing directly on the target Hackintosh machine, inspect the running hardware and software environment to gather ground-truth information:

```bash
# macOS version & build number
sw_vers

# OpenCore version reported in NVRAM
nvram 4D1FDA02-3869-4AC3-B16C-05650579D9DD:opencore-version

# Running Kexts
kextstat | grep -E "Lilu|VirtualSMC|AppleALC|SimpleHDA|AirportItlwm|itlwm|Voodoo|NVMeFix|YogaSMC|USBToolBox"

# Graphics & Hardware
system_profiler SPDisplaysDataType SPHardwareDataType
```

Take note of:
- Exact macOS version and build number (e.g., `macOS Tahoe 26.7.2 (Build 25G332)`).
- OpenCore version and release date (e.g., `REL-107-2026-03-20` -> OpenCore `1.0.7`).
- Active audio kext (e.g., `SimpleHDA.kext` vs `AppleALC.kext`).
- Active Wi-Fi kext (e.g., `AirportItlwm.kext` with Apple Control Center vs `itlwm.kext` with HeliPort).
- Known hardware quirks (e.g., trackpad electrical grounding lag on charger).

---

## 2. EFI Sanitization & Extraction

Never commit personal hardware identifiers (`SystemSerialNumber`, `SystemUUID`, `MLB`, `ROM`) to the repository or release archives. Always use or update the automated sanitization script.

### Steps:
1. Verify `Tools/extract_efi_without_serial.sh` exists and is up to date (compare against upstream reference scripts if needed).
2. Extract the sanitized EFI zip:
   ```bash
   ./Tools/extract_efi_without_serial.sh
   # If running from a specific directory:
   # ./Tools/extract_efi_without_serial.sh ~/Desktop/EFI
   ```
3. Verify the generated zip using the validation helper:
   ```bash
   ./.agents/skills/hackintosh-update-and-release/scripts/verify_sanitized_efi.sh Tools/OC_<version>_<YYYY>_<MM>_<DD>.zip
   ```
4. Verify the zip structure:
   - Archive must extract cleanly to `EFI/OC` and `EFI/BOOT`.
   - Ensure `Tools/*.zip` is in `.gitignore` so large binary archives are not committed to git history.

---

## 3. Version Folder & Assets

1. **Create Version Directory**:
   - Format: `<major>.x/<version>/` (e.g., `26.x/26.7.3/`).
2. **Screenshot Policy (STRICT)**:
   - **CRITICAL**: **NEVER reuse, duplicate, or copy a screenshot from a previous macOS version.**
   - **ALWAYS check if a fresh screenshot for the target version is placed.**
   - **If a screenshot is NOT placed or provided by the user, STOP and explicitly ASK the user to provide it.** Do NOT make assumptions or substitute older screenshots under any circumstance.
   - **Optimization & Compression**: Once the user provides the raw screenshot, compress it to 8-bit colormap PNG to prevent repository bloat (~20–50 KB):
     ```bash
     ffmpeg -i "raw_screenshot.png" -vf palettegen -vframes 1 /tmp/palette.png -y
     ffmpeg -i "raw_screenshot.png" -i /tmp/palette.png -lavfi "paletteuse=dither=bayer:bayer_scale=3" -vframes 1 "<major>.x/<version>/screenshot.png" -y
     ```
3. **Version README**:
   - Place a `README.md` in `<major>.x/<version>/README.md` detailing the macOS version, OpenCore build, screenshot, and hardware working status table.

---

## 4. Documentation Updates

### Root `README.md`
- **Screenshot Table**:
  - Keep only **one** screenshot column for the latest active release of each macOS version family.
  - When releasing a newer point/minor release (e.g. `macOS Tahoe 26.7.3`), **remove the previous point release column** (`macOS Tahoe 26.7.2`) from the table so that the root table remains concise and showcases only the latest release per macOS family.
- **Hardware Table**: Ensure every hardware component references the active upstream kext repository (e.g., [laobamac/SimpleHDA](https://github.com/laobamac/SimpleHDA), [laobamac/itlwm](https://github.com/laobamac/itlwm), [acidanthera/BrcmPatchRAM](https://github.com/acidanthera/BrcmPatchRAM), [lshbluesky/IntelBluetoothFirmware](https://github.com/lshbluesky/IntelBluetoothFirmware)).
- **Grouped Tables (Kexts & SSDTs)**:
  - **MANDATORY CONFIG AUDIT**: Always double-check `config.plist` (`Kernel -> Add` and `ACPI -> Add`) to verify the exact `Enabled` status (`True` vs `False`).
  - Explicitly mark disabled kexts (e.g., `YogaSMC.kext`, `USBMap.kext`, `itlwm.kext`, `ECEnabler.kext`) and disabled SSDTs (e.g., `SSDT-RHUB.aml`, `SSDT-ECRW.aml`, `SSDT-YVPC.aml`, `SSDT-RCSM.aml`) as **`Disabled`** in the table.
- **Hardware Quirks Callout**: Document any hardware-level quirks (e.g., trackpad lag caused by charger grounding issues across all operating systems).
- **Credits Section**: Keep credits updated with links to authors and upstream contributors.

### Installation Guide (`INSTALLATION_GUIDE_OPENCORE.md`)
- If missing or outdated, update `INSTALLATION_GUIDE_OPENCORE.md` following [Dortania Guide Structure](./references/dortania-guide-structure.md).
- Reference the official Dortania guide URL for the architecture (e.g., Coffee Lake Plus / Comet Lake laptops).
- Detail OpenCore sections: ACPI, Booter, DeviceProperties, Kernel, Misc, NVRAM, PlatformInfo, UEFI.
- Remind users to generate personal serial numbers before booting.

---

## 5. Git Workflow & Pull Request

Follow the standard pull request and branch lifecycle:

1. **Create Feature Branch**:
   ```bash
   git checkout -b feat--macos-<version>-support
   ```
2. **Review Changes & Commit**:
   ```bash
   git status
   git diff
   git add <modified-files>
   git commit -m "feat: macOS <version> support"
   ```
3. **Push & Create PR**:
   ```bash
   git push -u origin feat--macos-<version>-support
   gh pr create --title "feat: macOS <version> support" --body-file /tmp/pr_body.md
   ```
   *(See [PR Template](./references/pr-template.md) for body format).*
4. **Merge & Clean Up**:
   ```bash
   gh pr merge --squash --delete-branch
   git checkout main
   git pull origin main
   ```

---

## 6. GitHub Issue Triage

Check open issues before releasing:
```bash
gh issue list
gh issue view <issue-number>
```
- Evaluate reported problems against known hardware specifications (e.g., Ice Lake CPU using a Comet Lake EFI).
- Provide polite, technically detailed explanations with solutions or explanations of architectural incompatibility.
- Close resolved or non-applicable issues:
  ```bash
  gh issue comment <issue-number> --body "<explanation>"
  gh issue close <issue-number>
  ```

---

## 7. GitHub Release Publishing

Match previous repository releases in style, naming, and structure:

1. **Determine Tag and Title**:
   - Inspect existing releases: `gh release list`.
   - Increment semantic tag (e.g., `v3.0.0` -> `v4.0.0`).
   - Title format: `OpenCore <OC_version> build for macOS <OS_name> <OS_version>`.
2. **Draft Release Notes**:
   - Follow [Release Template](./references/release-template.md).
   - Include sections: `### Changelog`, `### What's Working/Not working`, `### Important`, and `## What's Changed`.
3. **Verify Release Asset**:
   - Ensure `Tools/OC_<version>_<YYYY>_<MM>_<DD>.zip` passes verification:
     ```bash
     ./.agents/skills/hackintosh-update-and-release/scripts/verify_sanitized_efi.sh Tools/OC_<version>_<YYYY>_<MM>_<DD>.zip
     ```
4. **Publish Release**:
   ```bash
   gh release create <tag> Tools/<archive.zip> --title "<title>" --notes-file /tmp/release_notes.md
   ```
5. **Verify Publication**:
   ```bash
   gh release view <tag>
   ```

---

## Checklist Summary

- [ ] Inspected running system (`sw_vers`, `nvram`, `kextstat`).
- [ ] Ran `Tools/extract_efi_without_serial.sh` and verified `verify_sanitized_efi.sh`.
- [ ] Verified fresh screenshot placed for target version (or asked user if missing; NEVER used previous version screenshot).
- [ ] Created `<major>.x/<version>/` with optimized `screenshot.png` and `README.md`.
- [ ] Updated root `README.md` (replaced previous point-release screenshot column with latest, verified and marked disabled Kexts/SSDTs, trackpad grounding note, credits).
- [ ] Verified or added `INSTALLATION_GUIDE_OPENCORE.md` following Dortania structure.
- [ ] Created branch `feat--macos-<version>-support`, committed, opened PR, and squash merged.
- [ ] Triaged and responded to open issues.
- [ ] Published GitHub release with tag `vX.Y.Z`, matching release title, and sanitized EFI zip.
