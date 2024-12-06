import Core
import Testing

@testable import Year2024

struct Year2024Tests {

    @Test
    func day1() {
        let sut = Day1()

        #expect(sut.part1() == 2031679, "Part 1")
        #expect(sut.part2() == 19678534, "Part 2")
    }

    @Test
    func day2() {
        let sut = Day2()

        #expect(sut.part1() == 624, "Part 1")
        #expect(sut.part2() == 658, "Part 2")
    }
}
