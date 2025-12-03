func d3part2(fileString: String) -> Int {
    var output: Int = 0

    func nextIteration(_ arr: [Int], _ remainingCount: Int) -> (nextBiggestNum: Int, nextArray: [Int]) {
        let endIndex = arr.count - remainingCount
        
        var nextBiggestNumber = -1
        var maxNumberIndex = -1
        for i in 0...endIndex {
            let val = arr[i]
            if val > nextBiggestNumber {
                nextBiggestNumber = val
                maxNumberIndex = i
            }
        }
        
        let nextArr = Array(arr[(maxNumberIndex+1)...])
        return (nextBiggestNum: nextBiggestNumber, nextArray: nextArr)
    }


    let lines: [String] = fileString.components(separatedBy: .newlines).filter { !$0.isEmpty }
    for line in lines {
        var bank: [Int] = []
        for char in line {
            let num = Int(String(char))!
            bank.append(num)
        }

        var currentArr = bank
        var remainingCount = 12
        var stringOutPut = ""

        for _ in 1...12 {
            let result = nextIteration(currentArr, remainingCount)
            stringOutPut += String(result.nextBiggestNum)
            currentArr = result.nextArray
            remainingCount -= 1
        }

        output += Int(stringOutPut)!

    }
    return output
}
