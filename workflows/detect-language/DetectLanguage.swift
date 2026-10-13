import Foundation
import NaturalLanguage

@main
struct DetectLanguage {
    static func main() {
        let input = String(data: FileHandle.standardInput.readDataToEndOfFile(), encoding: .utf8) ?? ""
        let text = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { exit(0) }
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)
        let hypotheses = recognizer.languageHypotheses(withMaximum: 3)
        let lines = hypotheses.map { (language, confidence) -> String in
            let name = Locale.current.localizedString(forIdentifier: language.rawValue) ?? language.rawValue
            return String(format: "%@ (%@) - %.0f%%", name, language.rawValue, confidence * 100)
        }
        print(lines.joined(separator: "\n"))
    }
}
