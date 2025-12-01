import Foundation

func readFile() -> String {
    let fileURL = URL(fileURLWithPath: "resources/input-1")
    let contents = try? String(contentsOf: fileURL, encoding: .utf8)
    return contents ?? "Failed to open file"
}

let fileString = readFile()
print("Part One: \(part1(fileString: fileString))")
print("Part Two: \(part2(fileString: fileString))")
