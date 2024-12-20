import Core
import Testing

@testable import Year2024

struct Year2024Tests {

    @Test
    func day01() {
        let sut = Day01()

        #expect(sut.part1() == 2031679, "Part 1")
        #expect(sut.part2() == 19678534, "Part 2")
    }

    @Test
    func day02() {
        let sut = Day02()

        #expect(sut.part1() == 624, "Part 1")
        #expect(sut.part2() == 658, "Part 2")
    }

    @Test
    func day03() {
        let sut = Day03()

        #expect(sut.part1() == 183380722, "Part 1")
        #expect(sut.part2() == 82733683, "Part 2")
    }

    @Test
    func day04() {
        let sut = Day04()

        #expect(sut.part1() == 2454, "Part 1")
        #expect(sut.part2() == 1858, "Part 2")
    }

    @Test
    func day05() {
        let sut = Day05()

        #expect(sut.part1() == 4609, "Part 1")
        #expect(sut.part2() == 5723, "Part 2")
    }

    @Test
    func day09() {
        let sut = Day09()

        #expect(sut.part1() == 6283404590840, "Part 1")
        #expect(sut.part2() == 6304576012713, "Part 2")
    }

    @Test
    func day10() {
        let sut = Day10()

        #expect(sut.part1() == 496, "Part 1")
        #expect(sut.part2() == 1120, "Part 2")
    }

    @Test
    func day11() {
        let sut = Day11()

        #expect(sut.part1() == 207683, "Part 1")
        #expect(sut.part2() == 244782991106220, "Part 2")
    }

    @Test
    func day12() {
        let sut = Day12()

        #expect(sut.part1() == 1477762, "Part 1")
        #expect(sut.part2() == 0, "Part 2")
    }
}
