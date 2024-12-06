// swift-tools-version: 6.0

import Foundation
import PackageDescription

let package = Package(
    name: "aoc",
    targets: [
        .target(name: "Core"),

        .testTarget(name: "AOCTests", dependencies: ["Core"])
    ]
)

func inputFiles(for year: Int) -> [String] {
    let path = URL(fileURLWithPath: #filePath).deletingLastPathComponent()

    return (1...25).compactMap { day in
        let fragment = "Day \(day)/input.txt"
        if FileManager.default.fileExists(atPath: path.appendingPathComponent("Sources/Year\(year)/\(fragment)").path) {
            return fragment
        }

        return nil
    }
}
