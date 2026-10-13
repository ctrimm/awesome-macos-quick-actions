import Foundation
import Vision

func eprint(_ message: String) { fputs(message + "\n", stderr) }

@main
struct AltTextImage {
    static func main() {
        let paths = CommandLine.arguments.dropFirst()
        guard !paths.isEmpty else { exit(0) }
        for path in paths {
            let url = URL(fileURLWithPath: path)
            do {
                let request = VNClassifyImageRequest()
                try VNImageRequestHandler(url: url, options: [:]).perform([request])
                let labels = (request.results ?? [])
                    .filter { $0.confidence >= 0.1 }
                    .prefix(4)
                    .map { $0.identifier.replacingOccurrences(of: ",", with: " or") }
                let alt = labels.isEmpty ? "No confident classification." : "A photo of \(labels.joined(separator: ", "))."
                let named = url.deletingPathExtension().path + "-alt.txt"
                try alt.write(to: URL(fileURLWithPath: named), atomically: true, encoding: .utf8)
                print(named)
            } catch {
                eprint("Could not describe \(path): \(error.localizedDescription)")
            }
        }
    }
}
