import Core
import Foundation

struct Day02: Day {

    func part1() -> Int {
        input().lines
            .map(\.integers)
            .count(where: isSafe)
    }

    func part2() -> Int {
        input().lines
            .map(\.integers)
            .count { values in
                isSafe(values) || isDampenerSafe(values)
            }
    }
}

private func isSafe(_ values: [Int]) -> Bool {
    let levels = zip(values.dropFirst(), values).map(-)

    return
        levels.map(\.signum).allSame &&
        levels.map(abs).allSatisfy { $0 <= 3 }
}

private func isDampenerSafe(_ values: [Int]) -> Bool {
    (0..<values.count).contains { index in
        var new = values
        new.remove(at: index)

        return isSafe(new)
    }
}
