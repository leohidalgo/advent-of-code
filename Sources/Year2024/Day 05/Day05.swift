import Core
import Foundation

struct Day05: Day {

    private typealias Rules = [Int: Set<Int>]
    private typealias Updates = [[Int]]

    func part1() -> Int {
        let (rules, updates) = Self.makeRules(input: input())

        return updates
            .filter { line in
                zip(line, line.dropFirst()).allSatisfy { lhs, rhs in
                    Self.lower(lhs: lhs, rhs: rhs, rules: rules)
                }
            }
            .map { line in
                line[line.count / 2]
            }
            .sum
    }

    func part2() -> Int {
        let (rules, updates) = Self.makeRules(input: input())

        return updates
            .filter { line in
                !zip(line, line.dropFirst()).allSatisfy { lhs, rhs in
                    Self.lower(lhs: lhs, rhs: rhs, rules: rules)
                }
            }
            .map { line in
                line.sorted { Self.lower(lhs: $0, rhs: $1, rules: rules) }
            }
            .map { line in
                line[line.count / 2]
            }
            .sum
    }

    private static func makeRules(input: Input) -> (Rules, Updates) {
        let rules = input.sections[0]
            .map(\.integers)
            .reduce(into: Rules()) { rules, pages in
                rules[pages[0], default: []].insert(pages[1])
            }

        let updates = input.sections[1].map(\.integers)

        return (rules, updates)
    }

    private static func lower(lhs: Int, rhs: Int, rules: Rules) -> Bool {
        rules[lhs, default: []].contains(rhs)
    }
}
