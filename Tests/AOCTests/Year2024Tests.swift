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

    @Test
    func day3() {
        let sut = Day3()

        #expect(sut.part1() == 183380722, "Part 1")
        #expect(sut.part2() == 82733683, "Part 2")
    }

    @Test
    func day4() {
        let sut = Day4()

        #expect(sut.part1() == 2454, "Part 1")
        #expect(sut.part2() == 1858, "Part 2")
    }

    @Test
    func day5() {
        let sut = Day5()

        #expect(sut.part1() == 4609, "Part 1")
        #expect(sut.part2() == 5723, "Part 2")
    }
}
