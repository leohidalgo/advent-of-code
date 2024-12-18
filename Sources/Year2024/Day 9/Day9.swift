import Core
import Foundation

struct Day9: Day {

    func part1() -> Int {
        var disk = Self.makeDisk(diskMap: input().characters)

        var left = 0
        var right = disk.count - 1

        while left < right {
            while disk[left] != "." { left += 1 }
            while disk[right] == "." { right -= 1 }

            disk[left] = disk[right]
            disk[right] = "."

            left += 1
            right -= 1
        }

        return disk
            .map { Int($0) ?? 0 }
            .enumerated()
            .map { $0.element * $0.offset }
            .sum
    }

    func part2() -> Int {
        var disk = Self.makeDisk(diskMap: input().characters)

        var left = 0
        var right = disk.count - 1
        while right > 0 {
            while right > 0 && disk[right] == "." { right -= 1 }

            left = right
            while left > 0 && disk[left] == disk[right] { left -= 1 }

            if let index = Self.firstFreeBlock(disk: disk, size: (right-left)), index < right {
                disk.replaceSubrange(index...index+right-left-1, with: disk[left+1...right])
                disk.replaceSubrange(left+1...right, with: Array(repeating: ".", count: right-left))
            }

            right = left
        }

        return disk
            .map { Int($0) ?? 0 }
            .enumerated()
            .map { $0.element * $0.offset }
            .sum
    }

    static func firstFreeBlock(disk: [String], size: Int) -> Int? {
        var right = 0
        var left = 0

        while left < disk.count - 1 {
            while left < disk.count - 1 && disk[left] != "." { left += 1 }

            right = left
            while right < disk.count - 1 && disk[right] == "." { right += 1 }

            if right - left >= size {
                return left
            }

            left = right
        }

        return nil
    }

    static func makeDisk(diskMap: [Character]) -> [String] {
        var currentFilename = 0

        return diskMap
            .compactMap(Int.init)
            .enumerated()
            .flatMap {
                let (index, value) = $0

                guard
                    index.isEven
                else { return Array(repeating: ".", count: value) }

                let data = Array(repeating: "\(currentFilename)", count: value)
                currentFilename += 1
                return data
            }
    }
}

