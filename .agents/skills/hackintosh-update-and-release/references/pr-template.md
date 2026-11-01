# Pull Request & Git Workflow Guidelines

## Branch Naming
- Create a dedicated feature branch for the update:
  - Format: `feat--macos-<version>-support`
  - *Example*: `feat--macos-26.7.2-support`

## Commit Convention
- Use Conventional Commits format:
  - Format: `feat: macOS <version> support`
  - *Example*: `feat: macOS 26.7.2 support`

## Pull Request Content Template

```markdown
### Summary of Changes

1. **EFI Extraction & Sanitization**:
   - Synchronized and verified `Tools/extract_efi_without_serial.sh`.
   - Extracted sanitized OpenCore EFI archive (`Tools/OC_<version>_<date>.zip`) with standard `EFI/OC` and `EFI/BOOT` structure.
   - Cleared `SystemSerialNumber`, `SystemUUID`, and `MLB`.

2. **Version Documentation & Screenshots**:
   - Added version folder `<major>.x/<version>/` with `README.md`.
   - Added compressed 8-bit colormap `screenshot.png` (~20-50 KB).

3. **Installation Guide**:
   - Added or updated `INSTALLATION_GUIDE_OPENCORE.md` with Dortania guide references and model-specific configuration details.

4. **Root README Updates**:
   - Added macOS version to the compatibility/screenshot table.
   - Grouped `Kexts Used` and `SSDTs Used` by hardware features.
   - Added hardware notes (e.g. trackpad charger grounding note).
   - Updated upstream kext/tool links in the hardware table and Credits section.

### Verification
- Tested and verified EFI archive structure and config syntax with `plutil`.
- Verified EFI archive sanitization (no personal serials or UUIDs).
- Verified markdown formatting and links.
```

## Merging & Cleanup
- Use squash merge with the PR title as the squash commit message:
  ```bash
  gh pr merge <PR_NUMBER> --squash --delete-branch
  ```
- Switch back to `main` and sync:
  ```bash
  git checkout main && git pull origin main
  ```

