func d3part1(fileString: String) -> Int {
    var output: Int = 0

    let lines: [String] = fileString.components(separatedBy: .newlines).filter { !$0.isEmpty }
    for line in lines {
        var bank: [Int] = []
        for char in line {
            let num = Int(String(char))!
            bank.append(num)
        }

        let maxSizeBankLength = bank.count-2
        let maxSizeBankForFirstBiggestNumber = Array(bank[...maxSizeBankLength])
        var sortedBank = Array(bank[...maxSizeBankLength])
        sortedBank.sort()
        let biggestNumber = sortedBank[sortedBank.count-1]

        var secondSortedBank: [Int]
        var secondBiggestNumberInRow: Int = 0
        for (i, num) in maxSizeBankForFirstBiggestNumber.enumerated() {
            if(num == biggestNumber) {
                secondSortedBank = Array(bank[(i+1)...])
                secondSortedBank.sort()
                secondBiggestNumberInRow = secondSortedBank[secondSortedBank.count-1]
                break
            }
        }

        var stringOutPut = String(biggestNumber)
        stringOutPut += String(secondBiggestNumberInRow)

        output += Int(stringOutPut)!

    }
    return output
}
