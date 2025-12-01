import Foundation

let dailStartingPos = 50;
let dailMin = 0;
let dailMax = 99;
var password = 0;

func readFile() -> String {
    let fileURL = URL(fileURLWithPath: "input.txt");
    let contents = try? String(contentsOf: fileURL, encoding: .utf8);
    return contents ?? "Failed to open file";
}

func goLeft(increment: Int, currentPos: Int) -> Int {
    var pos = currentPos;
    for _ in 0..<increment {
        pos -= 1
        pos = correctDailNumbers(dailNumber: pos)

        // Check Condition
        if (isPointingAtZero(pos: pos)) {
            password += 1
        }
    }
    return pos
}

func goRight(increment: Int, currentPos: Int) -> Int {
    var pos = currentPos;
    for _ in 0..<increment {
        pos += 1
        pos = correctDailNumbers(dailNumber: pos)

        // Check Condition
        if (isPointingAtZero(pos: pos)) {
            password += 1
        }
    }
    return pos
}

func correctDailNumbers(dailNumber: Int) -> Int {
    var pos = dailNumber
    if (pos < 0) {
        pos = 99
    }
    if (pos > 99) {
        pos = 0;
    }
    return pos
}

func isPointingAtZero(pos: Int) -> Bool {
    return pos == 0
}

func main() -> Int {
    var pos: Int = dailStartingPos;

    // Read and parse File
    let fileString: String = readFile();
    let lines: [String] = fileString.components(separatedBy: .newlines).filter { !$0.isEmpty }
    for instruction: String in lines {
        let direction = String(instruction.prefix(1))
        let incrementString: String = String(instruction.suffix(from: instruction.index(instruction.startIndex, offsetBy: 1)))
        let increment: Int = Int(incrementString) ?? 0

        // Move Left or Right
        if direction == "L" {
            pos = goLeft(increment: increment, currentPos: pos);
        } else if direction == "R" {
            pos = goRight(increment: increment, currentPos: pos);
        }

    }

    return password
}

print(main());