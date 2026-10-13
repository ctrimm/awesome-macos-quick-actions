import Foundation
import FoundationModels

func eprint(_ message: String) { fputs(message + "\n", stderr) }

@main
struct RewriteProfessional {
    static func main() async {
        guard #available(macOS 26, *) else {
            eprint("Rewrite in Professional Tone requires macOS 26 or later (Foundation Models framework).")
            exit(2)
        }
        let input = String(data: FileHandle.standardInput.readDataToEndOfFile(), encoding: .utf8) ?? ""
        let text = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { exit(0) }

        let availability = SystemLanguageModel.default.availability
        guard case .available = availability else {
            eprint("Apple Intelligence is not available (\(availability)). Enable it in System Settings > Apple Intelligence & Siri.")
            exit(3)
        }

        do {
            let session = LanguageModelSession(
                instructions: "Rewrite the user's text in a clear, professional tone. Fix spelling, grammar, and punctuation. Preserve the meaning and the original formatting (paragraphs, lists). Reply with ONLY the rewritten text."
            )
            let response = try await session.respond(to: text)
            print(response.content)
        } catch {
            eprint("Rewrite failed: \(error.localizedDescription)")
            exit(1)
        }
    }
}
