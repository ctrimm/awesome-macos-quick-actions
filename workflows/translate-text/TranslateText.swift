import Foundation
import Translation

func eprint(_ message: String) { fputs(message + "\n", stderr) }

@main
struct TranslateText {
    static func main() async {
        guard #available(macOS 15, *) else {
            eprint("Translate Text requires macOS 15 or later (Translation framework).")
            exit(2)
        }
        let targetCode = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "en"
        let input = String(data: FileHandle.standardInput.readDataToEndOfFile(), encoding: .utf8) ?? ""
        let text = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { exit(0) }

        do {
            let target = Locale.Language(identifier: targetCode)
            // nil source = automatic source-language detection, fully on-device
            // (requires the language pair downloaded in System Settings).
            let configuration = TranslationSession.Configuration(source: nil, target: target)
            let session = TranslationSession(configuration: configuration)
            let requests = [TranslationSession.Request(sourceText: text, clientIdentifier: "com.quickaction.translate-text")]
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
