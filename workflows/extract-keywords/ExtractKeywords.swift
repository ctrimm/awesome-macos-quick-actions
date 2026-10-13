import Foundation
import FoundationModels

func eprint(_ message: String) { fputs(message + "\n", stderr) }

@main
struct ExtractKeywords {
    static func main() async {
        guard #available(macOS 26, *) else {
            eprint("Extract Keywords requires macOS 26 or later (Foundation Models framework).")
            exit(2)
        }
        let instructions = "Extract the key topics and terms from this text as a bullet list, one per line, most important first. No preamble."

        let input = String(data: FileHandle.standardInput.readDataToEndOfFile(), encoding: .utf8) ?? ""
        let text = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { exit(0) }

        let availability = SystemLanguageModel.default.availability
        guard case .available = availability else {
            eprint("Apple Intelligence is not available (\(availability)). Enable it in System Settings > Apple Intelligence & Siri.")
            exit(3)
        }

        do {
            let session = LanguageModelSession(instructions: instructions)
            let response = try await session.respond(to: text)
            print(response.content)
        } catch {
            eprint("Keyword extraction failed: \(error.localizedDescription)")
            exit(1)
        }
    }
}
