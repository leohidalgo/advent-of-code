import Core
import Foundation

struct Day4: Day {

    func part1() -> Int {
        let target = Array("XMAS")
        let board = input().lines.map(\.characters)

        let directions: [Direction] = [
            .init(-1,  0),
            .init( 0,  1),
            .init( 1,  0),
            .init( 0, -1),
            .init(-1,  1),
            .init( 1,  1),
            .init( 1, -1),
            .init(-1, -1)
        ]

        func dfs(_ row: Int, _ col: Int, _ direction: Direction, _ index: Int) -> Bool {
            guard
                index != target.count
            else { return true }

            guard
                row >= 0 && row < board.count,
                col >= 0 && col < board[0].count,
                target[index] == board[row][col]
            else { return false }

            return dfs(row + direction.vertical, col + direction.horizontal, direction, index + 1)
        }

        var answer = 0
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                answer += directions
                    .count { dfs(row, col, $0, 0) }
            }
        }

        return answer
    }

    func part2() -> Int {
        0
    }
}

private struct Direction {
    let vertical: Int
    let horizontal: Int

    init(_ vertical: Int, _ horizontal: Int) {
        self.vertical = vertical
        self.horizontal = horizontal
    }
}
