func d2part2(fileString: String) -> Int {
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

    func splitIntoChunks(_ inputString: String, _ chunkSize: Int) -> [String]? {
        // Can only split if the string length is divisible by chunkSize
        if inputString.count % chunkSize != 0 {
            return nil
        }

        var result: [String] = []
        var currentIndex = inputString.startIndex

        while let nextIndex = inputString.index(
            currentIndex, offsetBy: chunkSize, limitedBy: inputString.endIndex
        ) {
            let chunk = String(inputString[currentIndex ..< nextIndex])
            result.append(chunk)
            currentIndex = nextIndex
        }

        return result
    }

    func checkCondition(range: [String]) {
        for num in range {
            // count of how many correct chunks are possible
            var count = 0
            let maxSize = num.count / 2
            guard maxSize >= 1 else { continue }
            for i in 1...maxSize {
                let splitUp = splitIntoChunks(num, i);
                if splitUp == nil { continue }
                let compareString = splitUp![0]
                var isSame = true
                for block in splitUp! {
                    if compareString != block {isSame = false}
                }
                if(!isSame) { continue }
                count += 1
            }
            if (count >= 1) {
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