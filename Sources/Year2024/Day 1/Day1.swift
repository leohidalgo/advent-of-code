import Core
import Foundation

struct Day1: Day {

    func part1() -> Int {
        var cols = (input().lines.map(\.integers[0]), input().lines.map(\.integers[1]))

        cols.0.sort()
        cols.1.sort()

        return zip(cols.0, cols.1)
           .map(-)
           .map(abs)
           .sum
    }

    func part2() -> Int {
        var hash: [Int: Int] = [:]
        let cols = (input().lines.map(\.integers[0]), input().lines.map(\.integers[1]))

        cols.1.forEach { hash[$0, default: 0] += 1 }

        return cols.0
            .map { hash[$0, default: 0] * $0 }
            .sum
    }
}
