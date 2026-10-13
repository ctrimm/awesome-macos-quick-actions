// RemoveBackgroundOnDevice.swift
//
// On-device background removal for the "Remove Background (On-Device AI)"
// macOS Finder Quick Action. Uses Vision's VNGenerateForegroundInstanceMaskRequest
// (the same on-device tech behind "lift subject from background") — nothing is
// ever uploaded to any server.
//
// Usage: RemoveBackgroundOnDevice <image-path> [...]
// For each image writes "<name>-nobg.png" next to the original (collision-safe);
// originals are never modified. Created paths go to stdout (one per line),
// per-file problems go to stderr. Exits non-zero only if nothing was created.

import AppKit
import CoreImage
import Vision

func removeBackground(from inputURL: URL) throws -> URL {
    guard let nsImage = NSImage(contentsOf: inputURL) else {
        throw NSError(domain: "RemoveBackground", code: 1,
                      userInfo: [NSLocalizedDescriptionKey: "Could not read image"])
    }
    var rect = NSRect(x: 0, y: 0, width: nsImage.size.width, height: nsImage.size.height)
    guard let cgImage = nsImage.cgImage(forProposedRect: &rect, context: nil, hints: nil) else {
        throw NSError(domain: "RemoveBackground", code: 2,
                      userInfo: [NSLocalizedDescriptionKey: "Could not decode image"])
    }

    let request = VNGenerateForegroundInstanceMaskRequest()
    let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    try handler.perform([request])

    guard let observation = request.results?.first as? VNInstanceMaskObservation,
          !observation.allInstances.isEmpty else {
        throw NSError(domain: "RemoveBackground", code: 3,
                      userInfo: [NSLocalizedDescriptionKey: "No foreground subject found"])
    }

    let maskBuffer = try observation.generateScaledMaskForImage(
        forInstances: observation.allInstances, from: handler)

    let ciContext = CIContext()
    let source = CIImage(cgImage: cgImage)
    let alphaMask = CIImage(cvPixelBuffer: maskBuffer).applyingFilter("CIMaskToAlpha")
    let transparent = CIImage(color: CIColor(red: 0, green: 0, blue: 0, alpha: 0))
        .cropped(to: source.extent)
    guard let blended = CIFilter(name: "CIBlendWithAlphaMask", parameters: [
        kCIInputImageKey: source,
        kCIInputBackgroundImageKey: transparent,
        kCIInputMaskImageKey: alphaMask
    ])?.outputImage,
    let outCG = ciContext.createCGImage(blended, from: source.extent) else {
        throw NSError(domain: "RemoveBackground", code: 4,
                      userInfo: [NSLocalizedDescriptionKey: "Could not composite image"])
    }

    let rep = NSBitmapImageRep(cgImage: outCG)
    rep.size = nsImage.size
    guard let png = rep.representation(using: .png, properties: [:]) else {
        throw NSError(domain: "RemoveBackground", code: 5,
                      userInfo: [NSLocalizedDescriptionKey: "Could not encode PNG"])
    }

    let dir = inputURL.deletingLastPathComponent()
    let stem = inputURL.deletingPathExtension().lastPathComponent
    var outURL = dir.appendingPathComponent("\(stem)-nobg.png")
    var n = 2
    while FileManager.default.fileExists(atPath: outURL.path) {
        outURL = dir.appendingPathComponent("\(stem)-nobg-\(n).png")
        n += 1
    }
    try png.write(to: outURL)
    return outURL
}

var created = 0
for arg in CommandLine.arguments.dropFirst() {
    let url = URL(fileURLWithPath: arg)
    do {
        let out = try removeBackground(from: url)
        print(out.path)
        created += 1
    } catch {
        fputs("Remove Background: \(url.lastPathComponent): \(error.localizedDescription)\n", stderr)
    }
}
if created == 0 {
    fputs("Remove Background: no images could be processed.\n", stderr)
    exit(1)
}
