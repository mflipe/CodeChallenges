/* MARK: - The Goal
Given a 2D array, print it in counter-clock wise spiral form. See the following examples.

 Input:
         1    2   3   4
         5    6   7   8
         9   10  11  12
         13  14  15  16
 
 Output:
 1 5 9 13 14 15 16 12 8 4 3 2 6 10 11 7

 Input:
         1   2   3   4  5   6
         7   8   9  10  11  12
         13  14  15 16  17  18
 
 Output:
 1 7 13 14 15 16 17 18 12 6 5 4 3 2 8 9 10 11
 
 */
// MARK: The Goal

/* MARK: - Default Code

 */// MARK: Default Code

// MARK: - Imports
import Foundation
import XCTest

// MARK: - Solution 1
func solution(matrix: [[Int]]) -> [Int] {
    var result: [Int] = []
    
    let firstColumn = getColumn(from: matrix, with: matrix.count, onColumn: 0)
    result.append(contentsOf: firstColumn)
    
    let lastRow = matrix.last!.dropFirst()
    result.append(contentsOf: lastRow)
    
    let lastColumn = getColumn(from: matrix, with: matrix.count, onColumn: matrix[0].count - 1)
        .reversed()
        .dropFirst()
    result.append(contentsOf: lastColumn)
    
    let fistRow = matrix.first!
        .reversed()
        .dropFirst()
        .dropLast()
    result.append(contentsOf: fistRow)
    
    let secondColumn = getColumn(from: matrix, with: matrix.count, onColumn: 1)
        .dropFirst()
        .dropLast()
    result.append(contentsOf: secondColumn)
    
    let thirdColumn = getColumn(from: matrix, with: matrix.count, onColumn: 2)
        .reversed()
        .dropLast()
        .dropFirst()
    result.append(contentsOf: thirdColumn)
    
    return result
}

func getColumn(from matrix: [[Int]], with numberOfRows: Int, onColumn index: Int) -> [Int]  {
    var column: [Int] = []
    
    for i in stride(from: 0, to: numberOfRows, by: 1) {
        let currentValue = matrix[i][index]
        column.append(currentValue)
    }
    
    return column
}

// MARK: - Solution 2

// MARK: - Test Cases
class Tests: XCTestCase {

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
        let input: [[Int]] = [[ 1, 2, 3, 4],
                              [ 5, 6, 7, 8],
                              [ 9, 10, 11, 12],
                              [13, 14, 15, 16]]
        let output: [Int] = [1, 5, 9, 13, 14, 15, 16, 12, 8, 4, 3, 2, 6, 10, 11, 7]
        
        var result: [Int] = []
        
        measure {
            result = solution(matrix: input)
        }
        
        XCTAssertEqual(result, output)
    }
    
    func test2() {
        let input: [[Int]] = [[ 1, 2, 3, 4, 5, 6],
                              [ 7, 8, 9, 10, 11, 12],
                              [ 13, 14, 15, 16, 17, 18]]
        let output: [Int] = [1, 7, 13, 14, 15, 16, 17, 18, 12, 6, 5, 4, 3, 2, 8, 9, 10, 11]
        
        var result: [Int] = []
        
        measure {
            result = solution(matrix: input)
        }
        
        XCTAssertEqual(result, output)
    }
}

Tests.defaultTestSuite.run()
