// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "aoc",
    targets: [
        .target(name: "Core"),

        .testTarget(name: "CoreTests", dependencies: ["Core"])
    ]
)
