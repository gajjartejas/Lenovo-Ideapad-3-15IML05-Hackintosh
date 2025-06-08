### Changelog

1.  macOS Sequoia 15.5 support added.
2.  OpenCore version updated to 1.0.4.
3.  Kexts updated.

### What's Working/Not working

1.  TrackPad high cpu(10% to 15%) usages and laggy - this might be hardware related, same issue in Windows 11.
2.  Sleep not working.
3. `AirportItlwm.kext` is not working, please use `itlwm.kext` + `HeliPort`.

### Important

Please add `SystemSerialNumber`, `SystemUUID` and `MLB`.
Please backup your efi before upgrading.

### Download

Please check release section to download.
