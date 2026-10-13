import Foundation
import Vision
import Translation

func eprint(_ message: String) { fputs(message + "\n", stderr) }

func recognizedText(in url: URL) throws -> String {
    let request = VNRecognizeTextRequest()
    request.recognitionLevel = .accurate
    request.usesLanguageCorrection = true
    try VNImageRequestHandler(url: url, options: [:]).perform([request])
    return (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
}

@main
struct TranslateImageText {
    static func main() async {
        guard #available(macOS 15, *) else {
            eprint("Translate Image Text requires macOS 15 or later (Translation framework).")
            exit(2)
        }
        let args = Array(CommandLine.arguments.dropFirst())
        guard args.count >= 2 else { exit(0) }
        let targetCode = args[0]
        let paths = Array(args.dropFirst())

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
        let combined = blocks.joined(separator: "\n\n").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !combined.isEmpty else {
            eprint("No text recognized in the selected images.")
            exit(1)
        }

        do {
            let target = Locale.Language(identifier: targetCode)
            // nil source = automatic source-language detection, fully on-device
            // (requires the language pair downloaded in System Settings).
            let configuration = TranslationSession.Configuration(source: nil, target: target)
            let session = TranslationSession(configuration: configuration)
            let requests = [TranslationSession.Request(sourceText: combined, clientIdentifier: "com.quickaction.translate-image-text")]
            for try await response in session.translate(batch: requests) {
                print(response.targetText)
            }
            session.invalidate()
        } catch {
            eprint("Translation failed: \(error.localizedDescription)")
            eprint("If the language pair is missing, download it in System Settings > General > Language & Region.")
            exit(1)
        }
    }
}
