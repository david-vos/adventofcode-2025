import Foundation

func readFile(filePath: String) -> String {
    let fileURL = URL(fileURLWithPath: filePath)
    let contents = try? String(contentsOf: fileURL, encoding: .utf8)
    return contents ?? "Failed to open file"
}

print(
    "================================" +
        "\n" +
        "Day 1: \n" +
        "TotalTime spent: 45 min \n" +
        "================================ \n"
)
print("Part One: \(d1part1(fileString: readFile(filePath: "resources/input-1")))")
print("Part Two: \(d1part2(fileString: readFile(filePath: "resources/input-1")))")

print(
    "================================" +
        "\n" +
        "Day 2: \n" +
        "TotalTime spent: 1h 49min \n" +
        "================================ \n"
)
print("Part One: \(d2part1(fileString: readFile(filePath: "resources/input-2")))")
print("Part Two: \(d2part2(fileString: readFile(filePath: "resources/input-2")))")

print(
    "================================" +
        "\n" +
        "Day 3: \n" +
        "TotalTime spent: \n" +
        "   part 1: 1h 9min \n" +
        "   part 2: 2h 24min \n" +
        "================================ \n"
)
print("Part One: \(d3part1(fileString: readFile(filePath: "resources/input-3")))")
print("Part Two: \(d3part2(fileString: readFile(filePath: "resources/input-3")))")

print(
    "================================" +
        "\n" +
        "Day 4: \n" +
        "TotalTime spent: \n" +
        "   part 1: 1h 8min \n" +
        "   part 2: 1h 28min \n" +
        "================================ \n"
)

print("Part One: \(d4part1(fileString: readFile(filePath: "resources/input-4")))")
print("Part Two: \(d4part2(fileString: readFile(filePath: "resources/input-4")))")
