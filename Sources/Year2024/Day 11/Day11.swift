import Core
import Foundation

struct Day11: Day {

    func part1() -> Int {
        var stones = input().stones()

        for _ in 0..<25 {
            stones.blink()
        }

        return stones.values.sum
    }

    func part2() -> Int {
        var stones = input().stones()

        for _ in 0..<75 {
            stones.blink()
        }

        return stones.values.sum
    }
}

private extension Input {

    func stones() -> [Int: Int] {
        integers.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    }
}

private extension Int {

    func stoneUpdate() -> [Self] {
        if self == 0 {
            return [1]
        } else if self.digits.count.isEven {
            let separator = Int(pow(10, Double(self.digits.count / 2)))

            let num1 = self / separator
            let num2 = self % separator

            return [num1, num2]
        }

        return [self * 2024]
    }
}

private extension Dictionary where Key == Int, Value == Int {

    mutating
    func blink() {
        self = self.reduce(into: [:]) { result, element in
            element.key
                .stoneUpdate()
                .forEach { result[$0, default: 0] += element.value }
        }
    }
}
