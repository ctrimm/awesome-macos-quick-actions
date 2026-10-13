import AppKit
import CoreImage
import Vision

func eprint(_ message: String) { fputs(message + "\n", stderr) }

func blurFaces(in inputURL: URL) throws -> URL {
    guard let nsImage = NSImage(contentsOf: inputURL) else {
        throw NSError(domain: "BlurFaces", code: 1,
                      userInfo: [NSLocalizedDescriptionKey: "Could not read image"])
    }
    var rect = NSRect(x: 0, y: 0, width: nsImage.size.width, height: nsImage.size.height)
    guard let cgImage = nsImage.cgImage(forProposedRect: &rect, context: nil, hints: nil) else {
        throw NSError(domain: "BlurFaces", code: 2,
                      userInfo: [NSLocalizedDescriptionKey: "Could not decode image"])
    }
    let w = CGFloat(cgImage.width), h = CGFloat(cgImage.height)
    let request = VNDetectFaceRectanglesRequest()
    try VNImageRequestHandler(cgImage: cgImage, options: [:]).perform([request])
    // Vision boxes are normalized, origin bottom-left — matches CIImage space.
    let faces: [CGRect] = (request.results ?? []).map { obs in
        let b = obs.boundingBox
        let pad: CGFloat = 0.15
        let x = max(0, (b.minX - b.width * pad) * w)
        let y = max(0, ((1 - b.maxY) - b.height * pad) * h)
        let fw = min(w - x, b.width * (1 + 2 * pad) * w)
        let fh = min(h - y, b.height * (1 + 2 * pad) * h)
        return CGRect(x: x, y: y, width: fw, height: fh)
    }
    guard !faces.isEmpty else {
        throw NSError(domain: "BlurFaces", code: 3,
                      userInfo: [NSLocalizedDescriptionKey: "No faces detected"])
    }
    let ciContext = CIContext()
    var composite = CIImage(cgImage: cgImage)
    for face in faces {
        let radius = max(10.0, face.width / 8.0)
        let blurred = composite.cropped(to: face)
            .applyingFilter("CIGaussianBlur", parameters: [kCIInputRadiusKey: radius])
            .cropped(to: face)
        composite = blurred.applyingFilter("CISourceOverCompositing",
            parameters: [kCIInputBackgroundImageKey: composite])
    }
    guard let outCG = ciContext.createCGImage(composite, from: composite.extent) else {
        throw NSError(domain: "BlurFaces", code: 4,
                      userInfo: [NSLocalizedDescriptionKey: "Could not render image"])
    }
    let rep = NSBitmapImageRep(cgImage: outCG)
    rep.size = nsImage.size
    guard let png = rep.representation(using: .png, properties: [:]) else {
        throw NSError(domain: "BlurFaces", code: 5,
                      userInfo: [NSLocalizedDescriptionKey: "Could not encode PNG"])
    }
    let dir = inputURL.deletingLastPathComponent()
    let stem = inputURL.deletingPathExtension().lastPathComponent
    var outURL = dir.appendingPathComponent("\(stem)-blurred.png")
    var n = 2
    while FileManager.default.fileExists(atPath: outURL.path) {
        outURL = dir.appendingPathComponent("\(stem)-blurred-\(n).png")
        n += 1
    }
    try png.write(to: outURL)
    return outURL
}

@main
struct BlurFaces {
    static func main() {
        var created = 0
        for arg in CommandLine.arguments.dropFirst() {
            let url = URL(fileURLWithPath: arg)
            do {
                print(try blurFaces(in: url).path)
                created += 1
            } catch {
                eprint("Blur Faces: \(url.lastPathComponent): \(error.localizedDescription)")
            }
        }
        if created == 0 {
            eprint("Blur Faces: no faces were blurred.")
            exit(1)
        }
    }
}
