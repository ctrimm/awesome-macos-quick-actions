import Foundation
import Vision

func eprint(_ message: String) { fputs(message + "\n", stderr) }

func recognizedText(in url: URL) throws -> String {
    let request = VNRecognizeTextRequest()
    request.recognitionLevel = .accurate
    request.usesLanguageCorrection = true
    try VNImageRequestHandler(url: url, options: [:]).perform([request])
    return (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
}

@main
struct ExtractTextOCR {
    static func main() {
        let paths = CommandLine.arguments.dropFirst()
        guard !paths.isEmpty else { exit(0) }
        var blocks: [String] = []
        for path in paths {
            do {
                let text = try recognizedText(in: URL(fileURLWithPath: path))
                if !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    blocks.append(text)
                }
            } catch {
                eprint("Could not read \(path): \(error.localizedDescription)")
            }
        }
        if !blocks.isEmpty {
            print(blocks.joined(separator: "\n\n"))
        }
    }
}
