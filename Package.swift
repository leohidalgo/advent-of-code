// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "aoc",
    platforms: [.macOS(.v14)],
    products: [.executable(name: "AOC", targets: ["AOC"])],
    targets: [
        .executableTarget(name: "AOC"),
        .target(name: "AOCCore"),
        .target(name: "AOC2023", dependencies: ["AOCCore"]),
        .testTarget(name: "AOCTests", dependencies: ["AOC2023"])
    ]
)
