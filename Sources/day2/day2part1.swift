func d2part1(fileString: String) -> Int {
    var finalOutput = 0

    func getAllNumbersFromRange(range: [String]) -> [String] {
        var output: [String] = []
        let leftSide: Int = Int(range[0])!
        let rightSide: Int = Int(range[1])!

        for num in leftSide...rightSide {
            output.append(String(num));
        }
        return output
    }

    func checkCondition(range: [String]) {
        for num in range {
            // early return because faster?
            if(num.count % 2 != 0) { continue }
            // Had to google how to index strings for this... thx Swift
            let startIndex = num.startIndex
            let halfIndex = num.index(startIndex, offsetBy: (num.count / 2))

            let leftSide = num[startIndex..<halfIndex]
            let rightSide = num[halfIndex..<num.endIndex]

            if leftSide == rightSide {
                finalOutput += Int(num)!
            }
        }
    }

    let ranges = fileString.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
    for range in ranges {
        let rangeArr = range.components(separatedBy: "-").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
        guard rangeArr.count >= 2 else { continue }
        let allNums = getAllNumbersFromRange(range: [rangeArr[0], rangeArr[1]])
        checkCondition(range: allNums);
    }

    return finalOutput
}