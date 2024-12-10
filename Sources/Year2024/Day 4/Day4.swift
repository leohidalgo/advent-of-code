import Core
import Foundation

struct Day4: Day {

    func part1() -> Int {
        let target = Array("XMAS")
        let board = input().lines.map(\.characters)

        let directions: [Direction] = [.up, .down, .left, .right, .upLeft, .upRight, .downLeft, .downRight]

        var answer = 0
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                answer += directions
                    .count { dfs(row, col, 0, $0, board, target) }
            }
        }

        return answer
    }

    func part2() -> Int {
        let target = Array("MAS")
        let board = input().lines.map(\.characters)

        var answer = 0
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if dfs(row, col, 0, .downRight, board, target)
                    && (dfs(row + 2, col, 0, .upRight, board, target) || dfs(row, col + 2, 0, .downLeft, board, target)) {

                    answer += 1
                }
                if dfs(row, col, 0, .upLeft, board, target)
                    && (dfs(row, col - 2, 0, .upRight, board, target) || dfs(row - 2, col, 0, .downLeft, board, target)) {

                    answer += 1
                }
            }
        }

        return answer
    }
}

private struct Direction: Hashable {

    static let up = Self(-1, 0)
    static let down = Self(1, 0)
    static let left = Self(0, -1)
    static let right = Self(0, 1)
    static let upLeft = Self(-1, -1)
    static let upRight = Self(-1, 1)
    static let downLeft = Self(1, -1)
    static let downRight = Self(1, 1)

    private let vertical: Int
    private let horizontal: Int

    private init(_ vertical: Int, _ horizontal: Int) {
        self.vertical = vertical
        self.horizontal = horizontal
    }

    func offset() -> (vertical: Int, horizontal: Int) {
        return (vertical, horizontal)
    }
}

private func dfs(_ row: Int, _ col: Int, _ index: Int, _ direction: Direction, _ board: [[Character]], _ target: [Character]) -> Bool {
    guard
        index < target.count
    else { return true }

    guard
        row >= 0 && row < board.count,
        col >= 0 && col < board[0].count,
        target[index] == board[row][col]
    else { return false }

    return dfs(row + direction.offset().vertical, col + direction.offset().horizontal, index + 1, direction, board, target)
}
