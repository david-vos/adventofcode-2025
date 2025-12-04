
func d4part1(fileString: String) -> Int {
    var map = inputToMap(fileString)
    var displayMap = inputToMap(fileString)
    var output = 0
    for (x, row) in map.enumerated() {
        for (y, point) in row.enumerated() {
            if point != "@" { continue }
            var count = 0

            if map.neighbor(dir: GridDirection.top, row: x, col: y) == "@" { count += 1 }
            if map.neighbor(dir: GridDirection.topRight, row: x, col: y) == "@" { count += 1 }
            if map.neighbor(dir: GridDirection.right, row: x, col: y) == "@" { count += 1 }
            if map.neighbor(dir: GridDirection.bottomRight, row: x, col: y) == "@" { count += 1 }
            if map.neighbor(dir: GridDirection.bottom, row: x, col: y) == "@" { count += 1 }
            if map.neighbor(dir: GridDirection.bottomLeft, row: x, col: y) == "@" { count += 1 }
            if map.neighbor(dir: GridDirection.left, row: x, col: y) == "@" { count += 1 }
            if map.neighbor(dir: GridDirection.topLeft, row: x, col: y) == "@" { count += 1 }

            if count < 4 {
                displayMap[x][y] = "x"
                output += 1
            }
        }
    }

//    printMap(displayMap)
    return output
}

enum GridDirection: CaseIterable {
    case top
    case topRight
    case right
    case bottomRight
    case bottom
    case bottomLeft
    case left
    case topLeft

    var offset: (row: Int, col: Int) {
        switch self {
        case .top: return (-1, 0)
        case .topRight: return (-1, 1)
        case .right: return (0, 1)
        case .bottomRight: return (1, 1)
        case .bottom: return (1, 0)
        case .bottomLeft: return (1, -1)
        case .left: return (0, -1)
        case .topLeft: return (-1, -1)
        }
    }
}

// I saw someone do this for day1 and wanted to try it out
// Its a pretty cool swift feateure ng
extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
}

extension Array where Element == [String] {
    // safe way to call instead of null pointer
    private func getElement(atRow row: Int, col: Int) -> String? {
        guard let rowArray = self[safe: row] else {
            return nil
        }
        return rowArray[safe: col]
    }

    func neighbor(dir direction: GridDirection, row: Int, col: Int) -> String? {
        let (rowOffset, colOffset) = direction.offset
        let newRow = row + rowOffset
        let newCol = col + colOffset
        return getElement(atRow: newRow, col: newCol)
    }
}

func inputToMap(_ input: String) -> [[String]] {
    var finalMap: [[String]] = [[]]
    let lines = input.components(separatedBy: .newlines).filter { !$0.isEmpty }
    for line in lines {
        var row: [String] = []
        for char in line {
            row.append(String(char))
        }
        finalMap.append(row)
    }
    return finalMap
}

func printMap(_ map: [[String]]) {
    for row in map {
        var rowString = ""
        for point in row {
            rowString += point
        }
        print(rowString)
    }
}