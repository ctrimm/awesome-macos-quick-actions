import Foundation
import Vision
import FoundationModels

func eprint(_ message: String) { fputs(message + "\n", stderr) }

func recognizedText(in url: URL) throws -> String {
    let request = VNRecognizeTextRequest()
    request.recognitionLevel = .accurate
    request.usesLanguageCorrection = true
    try VNImageRequestHandler(url: url, options: [:]).perform([request])
    return (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
}

@main
struct AIRenameScreenshot {
    static func main() async {
        guard #available(macOS 26, *) else {
            eprint("AI Rename Screenshot requires macOS 26 or later (Foundation Models framework).")
            exit(2)
        }
        let paths = CommandLine.arguments.dropFirst()
        guard !paths.isEmpty else { exit(0) }

        let availability = SystemLanguageModel.default.availability
        guard case .available = availability else {
            eprint("Apple Intelligence is not available (\(availability)). Enable it in System Settings > Apple Intelligence & Siri.")
            exit(3)
        }

        for path in paths {
            let url = URL(fileURLWithPath: path)
            let ocr: String
            do {
                ocr = try recognizedText(in: url)
            } catch {
                eprint("OCR failed for \(path): \(error.localizedDescription)")
                continue
            }
            let snippet = String(ocr.prefix(1500)).trimmingCharacters(in: .whitespacesAndNewlines)
            let context = snippet.isEmpty
                ? "No text was recognized in the image."
                : "Text recognized in the image:\n\(snippet)"
            let prompt = """
                Name this screenshot file. Its current filename is "\(url.lastPathComponent)".
                \(context)
                Rules: lowercase, words separated by hyphens, filesystem-safe (letters, numbers, hyphens only), \
                at most 60 characters, no file extension. Describe what the screenshot shows.
                Reply with ONLY the filename, nothing else.
                """
            do {
                let session = LanguageModelSession()
                let response = try await session.respond(to: prompt)
                let name = response.content.trimmingCharacters(in: .whitespacesAndNewlines)
                print("\(path)\t\(name)")
            } catch {
                eprint("Naming failed for \(path): \(error.localizedDescription)")
            }
        }
    }
}
