// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "advent-of-code-2025",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "aoc", targets: ["aoc"]),
    ],
    targets: [
        .executableTarget(
            name: "aoc",
            path: "Sources"
        ),
    ]
)
