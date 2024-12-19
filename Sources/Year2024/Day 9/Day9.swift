import Core
import Foundation

struct Day9: Day {

    func part1() -> Int {
        var blocks = input().makeBlocks()

        var left = 0
        var right = blocks.count - 1

        while left < right {
            while blocks[left].isFile { left += 1 }
            while blocks[right].isFree { right -= 1 }

            if left < right {
                blocks.swapAt(left, right)
            }
        }

        return blocks.checksum()
    }

    func part2() -> Int {
        return -1
    }
}

private enum Block: CustomDebugStringConvertible {
    case file(id: Int)
    case free

    var debugDescription: String {
        if case let .file(id) = self { "\(id)" }
        else { "." }
    }

    var isFile: Bool {
        if case .file = self { true }
        else { false }
    }

    var isFree: Bool {
        if case .free = self { true }
        else { false }
    }
}

private extension Input {

    func makeBlocks() -> [Block] {
        var currentId = 0

        return characters
            .compactMap(Int.init)
            .enumerated()
            .flatMap { item in
                if item.offset.isEven {
                    defer { currentId += 1 }

                    return Array(repeating: Block.file(id: currentId), count: item.element)
                } else {
                    return Array(repeating: Block.free, count: item.element)
                }
            }
    }
}

private extension Collection where Element == Block {

    func checksum() -> Int {
        self
            .enumerated()
            .map {
                if case let .file(id) = $0.element { id * $0.offset }
                else { 0 }
            }
            .sum
    }
}
