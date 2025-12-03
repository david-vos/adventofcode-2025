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

