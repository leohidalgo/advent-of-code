import Core
import Foundation
import RegexBuilder

struct Day3: Day {

    func part1() -> Int {
        let query = Regex {
            "mul("
            TryCapture.integer
            ","
            TryCapture.integer
            ")"
        }

        return input().raw.matches(of: query)
            .map { $0.output.1 * $0.output.2 }
            .sum
    }

    func part2() -> Int {
        let query = Regex {
            ChoiceOf {
                "don't"
                "do"
                Regex {
                    "mul("
                    TryCapture.integer
                    ","
                    TryCapture.integer
                    ")"
                }
            }
        }

        var isActive = true
        var total = 0
        for match in input().raw.matches(of: query) {
            switch (match.output.0, isActive) {
            case ("do", _): isActive = true
            case ("don't", _): isActive = false
            case (_, false): continue
            default: total += (match.output.1 ?? 0) * (match.output.2 ?? 0)
            }
        }

        return total
    }
}
