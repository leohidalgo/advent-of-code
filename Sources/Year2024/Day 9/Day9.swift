import Core
import Foundation

struct Day9: Day {

    func part1() -> Int {
        var memory = input().diskPart1()

        var left = 0
        var right = memory.count - 1

        while left < right {
            while memory[left] != "." { left += 1 }
            while memory[right] == "." { right -= 1 }

            if left < right {
                memory.swapAt(left, right)
            }
        }

        return memory.checksum()
    }

    func part2() -> Int {
        var (files, free) = input().diskPart2()

        for currentId in (0..<files.count).reversed() {
            guard let file = files[currentId] else { break }

            for i in 0..<free.count {
                guard file.index > free[i].index else { break }
                guard file.size <= free[i].size else { continue }

                files[currentId] = (free[i].index, file.size)

                if free[i].size - file.size > 0 {
                    free[i] = (free[i].index + file.size, free[i].size - file.size)
                } else {
                    free.remove(at: i)
                }

                break
            }
        }

        return files.checksum()
    }
}

private typealias Block = (index: Int, size: Int)

private extension Input {

    func diskPart1() -> [String] {
        var currentId = 0

        return characters
            .compactMap(Int.init)
            .enumerated()
            .flatMap { item in
                if item.offset.isEven {
                    defer { currentId += 1 }

                    return Array(repeating: "\(currentId)", count: item.element)
                } else {
                    return Array(repeating: ".", count: item.element)
                }
            }
    }

    func diskPart2() -> (files: [Int: Block], free: [Block]) {
        var files: [Int: Block] = [:]
        var free: [Block] = []

        var currentId = 0
        var currentPosition = 0

        self.characters
            .compactMap(Int.init)
            .enumerated()
            .forEach {
                let (index, size) = $0
                let item = (currentPosition, size)

                if index.isEven {
                    defer { currentId += 1 }
                    files[currentId] = item
                } else if size > 0 {
                    free.append(item)
                }

                currentPosition += size
            }

        return (files, free)
    }
}

private extension Collection where Element == String {

    func checksum() -> Int {
        self
            .map { Int($0) ?? 0 }
            .enumerated()
            .map { $0.element * $0.offset }
            .sum
    }
}

private extension Dictionary where Value == Block, Key == Int {

    func checksum() -> Int {
        self
            .map { item in
                let startIndex = item.value.index
                let endIndex = item.value.index + item.value.size

                return (startIndex..<endIndex).sum * item.key
            }
            .sum
    }
}
