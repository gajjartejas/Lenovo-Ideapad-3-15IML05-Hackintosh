import AppKit
let folder = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)
try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
func render(_ pixels: Int) -> Data {
    let bitmap = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: pixels, pixelsHigh: pixels, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
    let context = NSGraphicsContext(bitmapImageRep: bitmap)!
    NSGraphicsContext.saveGraphicsState(); NSGraphicsContext.current = context
    context.cgContext.scaleBy(x: CGFloat(pixels)/1024, y: CGFloat(pixels)/1024)
    let base = NSBezierPath(roundedRect: NSRect(x: 80, y: 80, width: 864, height: 864), xRadius: 192, yRadius: 192)
    let shadow = NSShadow(); shadow.shadowColor = NSColor.black.withAlphaComponent(0.22); shadow.shadowBlurRadius = 22; shadow.shadowOffset = NSSize(width: 0, height: -12)
    NSGraphicsContext.saveGraphicsState(); shadow.set(); NSColor.systemBlue.setFill(); base.fill(); NSGraphicsContext.restoreGraphicsState()
    NSGradient(starting: NSColor(calibratedRed: 0.12, green: 0.32, blue: 0.88, alpha: 1), ending: NSColor(calibratedRed: 0.04, green: 0.71, blue: 0.66, alpha: 1))!.draw(in: base, angle: 50)
    NSColor.white.withAlphaComponent(0.20).setStroke(); base.lineWidth = 3; base.stroke()
    let screen = NSBezierPath(roundedRect: NSRect(x: 242, y: 342, width: 540, height: 374), xRadius: 30, yRadius: 30)
    NSColor.white.withAlphaComponent(0.96).setStroke(); screen.lineWidth = 27; screen.stroke()
    let foot = NSBezierPath(); foot.move(to: NSPoint(x: 186, y: 285)); foot.line(to: NSPoint(x: 838, y: 285)); foot.lineCapStyle = .round; foot.lineWidth = 32; foot.stroke()
    let battery = NSBezierPath(roundedRect: NSRect(x: 344, y: 446, width: 312, height: 160), xRadius: 24, yRadius: 24)
    NSColor.white.withAlphaComponent(0.96).setFill(); battery.fill()
    NSBezierPath(roundedRect: NSRect(x: 663, y: 499, width: 22, height: 54), xRadius: 7, yRadius: 7).fill()
    let bolt = NSBezierPath(); bolt.move(to: NSPoint(x: 529, y: 588)); bolt.line(to: NSPoint(x: 470, y: 523)); bolt.line(to: NSPoint(x: 511, y: 523)); bolt.line(to: NSPoint(x: 483, y: 465)); bolt.line(to: NSPoint(x: 550, y: 538)); bolt.line(to: NSPoint(x: 509, y: 538)); bolt.close()
    NSColor(calibratedRed: 0.06, green: 0.49, blue: 0.75, alpha: 1).setFill(); bolt.fill()
    NSGraphicsContext.restoreGraphicsState()
    return bitmap.representation(using: .png, properties: [:])!
}
for size in [16,32,128,256,512] {
    try render(size).write(to: folder.appendingPathComponent("icon_\(size)x\(size).png"))
    try render(size*2).write(to: folder.appendingPathComponent("icon_\(size)x\(size)@2x.png"))
}
