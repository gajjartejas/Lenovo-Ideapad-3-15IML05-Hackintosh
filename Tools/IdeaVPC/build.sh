#!/bin/zsh
set -eu
cd "${0:A:h}"
APP="$PWD/Build/IdeaVPC.app"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"
if [[ ! -f Assets/AppIcon.icns || Assets/GenerateIcon.swift -nt Assets/AppIcon.icns ]]; then
    swift Assets/GenerateIcon.swift Assets/AppIcon.iconset
    iconutil -c icns Assets/AppIcon.iconset -o Assets/AppIcon.icns
fi
cp Assets/AppIcon.icns "$APP/Contents/Resources/AppIcon.icns"
swiftc -O -swift-version 5 -parse-as-library Sources/*.swift -o "$APP/Contents/MacOS/IdeaVPC" -framework SwiftUI -framework AppKit -framework IOKit
cat > "$APP/Contents/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleIdentifier</key><string>local.tejas.IdeaVPC</string>
<key>CFBundleName</key><string>IdeaVPC</string>
<key>CFBundleDisplayName</key><string>IdeaVPC</string>
<key>CFBundleExecutable</key><string>IdeaVPC</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleShortVersionString</key><string>1.0</string>
<key>CFBundleVersion</key><string>3</string>
<key>CFBundleIconFile</key><string>AppIcon</string>
<key>LSMinimumSystemVersion</key><string>26.0</string>
<key>NSHighResolutionCapable</key><true/>
<key>NSPrincipalClass</key><string>NSApplication</string>
</dict></plist>
PLIST
codesign --force --sign - "$APP"
