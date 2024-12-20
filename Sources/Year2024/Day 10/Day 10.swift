import Core
import Foundation

struct Day10: Day {

    func part1() -> Int {
        let map = input().lines.map(\.characters).map { $0.compactMap(Int.init) }

        var answer = 0
        for (i, line) in map.enumerated() {
            for (j, item) in line.enumerated() where item == 0 {
                answer += Set(Self.dfs(i, j, 0, map)).count
            }
        }

        return answer
    }

    func part2() -> Int {
        let map = input().lines.map(\.characters).map { $0.compactMap(Int.init) }

        var answer = 0
        for (i, line) in map.enumerated() {
            for (j, item) in line.enumerated() where item == 0 {
                answer += Self.dfs(i, j, 0, map).count
            }
        }

        return answer
    }

    private static func dfs(_ row: Int, _ col: Int, _ target: Int, _ map: [[Int]]) -> [Point] {
        guard
            row >= 0 && row < map.count,
            col >= 0 && col < map[0].count,
            target == map[row][col]
        else { return [] }

        guard
            target != 9
        else { return [Point(row, col)] }

        var answer: [Point] = []

        answer.append(contentsOf: dfs(row - 1, col, target + 1, map))
        answer.append(contentsOf: dfs(row + 1, col, target + 1, map))
        answer.append(contentsOf: dfs(row, col - 1, target + 1, map))
        answer.append(contentsOf: dfs(row, col + 1, target + 1, map))

        return answer
    }
}
