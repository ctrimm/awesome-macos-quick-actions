import Foundation
import FoundationModels

func eprint(_ message: String) { fputs(message + "\n", stderr) }

@main
struct SummarizeText {
    static func main() async {
        guard #available(macOS 26, *) else {
            eprint("Summarize Text requires macOS 26 or later (Foundation Models framework).")
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
                instructions: "Summarize the user's text in 3-5 concise bullet points covering the key points. Plain text only, no preamble."
            )
            let response = try await session.respond(to: text)
            print(response.content)
        } catch {
            eprint("Summarization failed: \(error.localizedDescription)")
            exit(1)
        }
    }
}
