import Foundation
import PDFKit
import FoundationModels

func eprint(_ message: String) { fputs(message + "\n", stderr) }

@main
struct SummarizePDF {
    static func main() async {
        guard #available(macOS 26, *) else {
            eprint("Summarize PDF requires macOS 26 or later (Foundation Models framework).")
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
            guard let document = PDFDocument(url: url) else {
                eprint("Could not open \(path) as a PDF.")
                continue
            }
            var text = ""
            for i in 0..<min(document.pageCount, 60) {
                if let pageText = document.page(at: i)?.string {
                    text += pageText + "\n"
                    if text.count > 12000 { break }
                }
            }
            text = String(text.prefix(12000)).trimmingCharacters(in: .whitespacesAndNewlines)
            guard !text.isEmpty else {
                eprint("No extractable text in \(path) (it may be scanned images).")
                continue
            }
            do {
                let session = LanguageModelSession(
                    instructions: "Summarize the user's document in 5-8 concise bullet points covering the key points. Plain text only, no preamble."
                )
                let response = try await session.respond(to: text)
                let outPath = url.deletingPathExtension().path + "-summary.txt"
                try response.content.write(to: URL(fileURLWithPath: outPath), atomically: true, encoding: .utf8)
                print(outPath)
            } catch {
                eprint("Summarization failed for \(path): \(error.localizedDescription)")
            }
        }
    }
}
