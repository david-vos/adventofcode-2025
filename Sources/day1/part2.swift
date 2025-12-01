func part2(fileString: String) -> Int {
    let dialStartingPos = 50
    var pos = dialStartingPos
    var password = 0
    
    func goLeft(increment: Int, currentPos: Int, password: inout Int) -> Int {
        var pos = currentPos
        for _ in 0..<increment {
            pos -= 1
            pos = correctDialNumbers(dialNumber: pos)
            
            if isPointingAtZero(pos: pos) {
                password += 1
            }
        }
        return pos
    }
    
    func goRight(increment: Int, currentPos: Int, password: inout Int) -> Int {
        var pos = currentPos
        for _ in 0..<increment {
            pos += 1
            pos = correctDialNumbers(dialNumber: pos)
            
            if isPointingAtZero(pos: pos) {
                password += 1
            }
        }
        return pos
    }
    
    func correctDialNumbers(dialNumber: Int) -> Int {
        var pos = dialNumber
        if pos < 0 {
            pos = 99
        }
        if pos > 99 {
            pos = 0
        }
        return pos
    }
    
    func isPointingAtZero(pos: Int) -> Bool {
        return pos == 0
    }
    
    let lines = fileString.components(separatedBy: .newlines).filter { !$0.isEmpty }
    
    for instruction in lines {
        let direction = String(instruction.prefix(1))
        let incrementString = String(instruction.suffix(from: instruction.index(instruction.startIndex, offsetBy: 1)))
        let increment = Int(incrementString) ?? 0
        
        if direction == "L" {
            pos = goLeft(increment: increment, currentPos: pos, password: &password)
        } else if direction == "R" {
            pos = goRight(increment: increment, currentPos: pos, password: &password)
        }
    }
    
    return password
}
