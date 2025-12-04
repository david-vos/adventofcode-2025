
func d4part2(fileString: String) -> Int {
    var map = inputToMap(fileString)
    var somethingChanged = true
    var output = 0
    while somethingChanged {
        let runOutput = runMap(map)
        map = runOutput.nextMap
        somethingChanged = runOutput.somethingChanged
        output += runOutput.rollsRemoved
    }
    return output
}

func runMap(_ map: [[String]]) -> (nextMap: [[String]], somethingChanged: Bool, rollsRemoved: Int) {
    var nextMap = map
    var rolesRemoved: Int = 0
    var somethingChanged = false
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
                somethingChanged = true
                nextMap[x][y] = "."
                rolesRemoved += 1
            }
        }
    }
    return (nextMap, somethingChanged, rolesRemoved)
}
