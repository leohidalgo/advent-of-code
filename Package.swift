// swift-tools-version: 6.0

import Foundation
import PackageDescription

let package = Package(
    name: "aoc",
    platforms: [
        .macOS(.v15)
    ],
    targets: [
        .target(name: "Core"),
        .target(name: "Year2024", dependencies: ["Core"], exclude: inputFiles(for: 2024)),

        .testTarget(name: "AOCTests", dependencies: ["Core", "Year2024"])
    ]
)

func inputFiles(for year: Int) -> [String] {
    let path = URL(fileURLWithPath: #filePath).deletingLastPathComponent()

    return (1...25).compactMap { day in
        let fragment = day > 9 ? "Day \(day)/input.txt" : "Day 0\(day)/input.txt"
        if FileManager.default.fileExists(atPath: path.appendingPathComponent("Sources/Year\(year)/\(fragment)").path) {
            return fragment
        }

        return nil
    }
}
