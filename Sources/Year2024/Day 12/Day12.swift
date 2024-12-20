import Core
import Foundation

struct Day12: Day {

    func part1() -> Int {
        let map = input().lines.map(\.characters)
        var path: Set<Point> = []

        var answer = 0
        for i in 0..<map.count {
            for j in 0..<map[0].count {
                if !path.contains(Point(i, j)) {
                    let (count, perimeter) = Self.dfs(i, j, map[i][j], map, &path)
                    answer += (count * perimeter)
                }
            }
        }

        return answer
    }

    func part2() -> Int {
        return -1
    }

    static func dfs(_ row: Int, _ col: Int, _ target: Character, _ map: [[Character]], _ path: inout Set<Point>) -> (count: Int, perimeter: Int) {
        guard
            row >= 0 && row < map.count,
            col >= 0 && col < map[0].count,
            target == map[row][col]
        else { return (0, 1) }

        guard
            !path.contains(Point(row, col))
        else { return (0, 0) }

        path.insert(Point(row, col))

        let up = dfs(row - 1, col, target, map, &path)
        let down = dfs(row + 1, col, target, map, &path)
        let left = dfs(row, col - 1, target, map, &path)
        let right = dfs(row, col + 1, target, map, &path)

        return [up, down, left, right]
            .reduce((1, 0)) { result, item in
                (result.0 + item.0, result.1 + item.1)
            }
    }
}

