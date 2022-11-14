/* MARK: - The Goal
  
 */
// MARK: The Goal

/* MARK: - Default Code

 */// MARK: Default Code

// MARK: - Imports
import Foundation
import XCTest

// MARK: - Solution 1
// T1: average: 0.001 - [0.007722, 0.001135, 0.000581, 0.000467, 0.000476, 0.000438, 0.000418, 0.000413, 0.000420, 0.000416]
// T2: average: 0.001 - [0.004918, 0.000777, 0.000822, 0.000830, 0.000638, 0.000381, 0.000359, 0.000369, 0.000370, 0.000377]
/*
func solution(matrix: [[Int]]) -> Int {
    let tMatrix = transpose(matrix/*, defaultValue: 100*/)
    
    var result = 0
    for linha in 0..<tMatrix.count {
        for coluna in 0..<tMatrix[0].count {
            let value = tMatrix[linha][coluna]
            if value == 0 { break }
            result += value
        }
    }
    
    return result
}
 
func transpose<T>(_ input: [[T]], defaultValue: T) -> [[T]] {
    let columns = input.count
    let rows = input.reduce(0) { max($0, $1.count) }

    return (0 ..< rows).reduce(into: []) { result, row in
        result.append((0 ..< columns).reduce(into: []) { result, column in
            result.append(row < input[column].count ? input[column][row] : defaultValue)
        })
    }
}

func transpose<T>(_ input: [[T]]) -> [[T]] {
    guard let firstRow = input.first else { return [] }
    return firstRow.indices.map { index in
        input.map{ $0[index] }
    }
}
*/

// average: 0.000 - [0.001746, 0.000113, 0.000084, 0.000083, 0.000082, 0.000099, 0.000096, 0.000084, 0.000082, 0.000082]
// average: 0.000 - [0.002174, 0.000136, 0.000081, 0.000079, 0.000077, 0.000077, 0.000076, 0.000076, 0.000076, 0.000077]
// average: 0.000 - [0.001952, 0.000169, 0.000140, 0.000139, 0.000140, 0.000141, 0.000140, 0.000138, 0.000158, 0.000168]
func solution(matrix: [[Int]]) -> Int {
    var resultado: Int = 0
    for coluna in 0..<matrix[0].count {
        for linha in matrix {
            if linha[coluna] != 0 {
                resultado += linha[coluna]
                continue
            }
            break
        }
    }
    return resultado
}

// MARK: - Solution 2

// MARK: - Test Cases
class Tests: XCTestCase {

    var input: [[Int]] = [[0,1,1,2],
                          [0,5,0,0],
                          [2,0,3,3]]
    var output: Int = 9

    override class func setUp() {
        super.setUp()
    }

    override class func tearDown() {
        super.tearDown()
    }

    override func setUp() {
        super.setUp()
        print("\n⬇️ Debug ----------")
    }

    override func tearDown() {
        super.tearDown()
        print("⬆️ Debug ----------")

        guard let count = testRun?.failureCount else { return }

        if count == 0 {
            print("Result: ✅ Success\n")
        } else {
            print("Result: 🔴 Failed\n")
        }
    }

    func test1() {
        measure {
            let _ = solution(matrix: input)
        }
    }
    
    func test2() {
        let result = solution(matrix: input)
        XCTAssertEqual(result, output)
    }
}

Tests.defaultTestSuite.run()
