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
/* 1,630 s
func solution(matrix: [[Int]]) -> [Int] {
    guard !matrix.isEmpty else { return [] }
    
    var result: [Int] = []
    
    
    // Anti-clockwise
    var currentFistRowIndex: Int = 0
    var currentLastRowIndex: Int = matrix.count - 1
    var rowSkipFirst: Int = 1
    var rowSkipLast: Int = 0
    
    var currentFirstColumnIndex: Int = 0
    var currentLastColumnIndex: Int = matrix[0].count - 1
    var columnSkipFirst: Int = 0
    var columnSkipLast: Int = 0
    
    var totalOfElements = matrix.count * matrix[0].count
    
    while(result.count < totalOfElements) {
        
        // Column 0
        let firstColumn = getColumn(
            from: matrix,
            onColumn: currentFirstColumnIndex,
            dropFirst: columnSkipFirst,
            dropLast: columnSkipLast,
            isReversed: false
        )
        result.append(contentsOf: firstColumn)
        
        currentFirstColumnIndex += 1
        columnSkipFirst += 1
        
        if (result.count == totalOfElements) {
            break
        }
        
        // Row Last
        let lastRow = getRow(
            from: matrix,
            onRow: currentLastRowIndex,
            dropFirst: rowSkipFirst,
            dropLast: rowSkipLast,
            isReversed: false
        )
        result.append(contentsOf: lastRow)
        
        currentLastRowIndex -= 1
        rowSkipLast += 1
        
        if (result.count == totalOfElements) {
            break
        }
        
        // Column Last
        let lastColumn = getColumn(
            from: matrix,
            onColumn: currentLastColumnIndex,
            dropFirst: columnSkipFirst,
            dropLast: columnSkipLast,
            isReversed: true
        )
        result.append(contentsOf: lastColumn)
        
        columnSkipLast += 1
        
        if (result.count == totalOfElements) {
            break
        }
        
        // Row 1
        let fistRow = getRow(
            from: matrix,
            onRow: currentFistRowIndex,
            dropFirst: rowSkipFirst,
            dropLast: rowSkipLast,
            isReversed: true
        )
        result.append(contentsOf: fistRow)
        
        currentFistRowIndex += 1
        columnSkipLast += 1
        
        if (result.count == totalOfElements) {
            break
        }
    }
    
    return result
}

func getColumn(from matrix: [[Int]], onColumn index: Int,
               dropFirst leftDrop: Int, dropLast rightDrop: Int, isReversed: Bool) -> [Int]  {
    var column: [Int] = []
    let numberOfRows = matrix.count
    
    for i in stride(from: 0, to: numberOfRows, by: 1) {
        let currentValue = matrix[i][index]
        column.append(currentValue)
    }
    
    column = applyDropAndInvert(from: column, dropFirst: leftDrop, dropLast: rightDrop, isReversed: isReversed)
    
    return column
}

func getRow(from matrix: [[Int]], onRow index: Int,
            dropFirst leftDrop: Int, dropLast rightDrop: Int, isReversed: Bool) -> [Int] {
    
    var row: [Int] = matrix[index]

    row = applyDropAndInvert(from: row, dropFirst: leftDrop, dropLast: rightDrop, isReversed: isReversed)

    return row
}

func applyDropAndInvert(from array: [Int],
            dropFirst leftDrop: Int, dropLast rightDrop: Int, isReversed: Bool) -> [Int] {
    var newArray = array
    
    if (isReversed) {
        newArray = Array(newArray.reversed())
    }
    
    if (leftDrop > 0) {
        newArray = Array(newArray.dropFirst(leftDrop))
    }
    
    if (rightDrop > 0 ) {
        newArray = Array(newArray.dropLast(rightDrop))
    }
    
    return newArray
}
*/
// MARK: - Solution 2
func solution(matrix arr: [[Int]]) -> [Int] {
    guard !arr.isEmpty else { return [] }
    
    var m = arr.count
    var n = arr[0].count
    
    var result: [Int] = []
    
    var k = 0, l = 0
    var cnt = 0
    let total = m * n
    
    while k < m && l < n {
        if cnt == total {
            break
        }
        
        // Print the first column from the remaining columns
        for i in k..<m {
            result.append(arr[i][l])
            cnt += 1
        }
        l += 1
        
        if cnt == total {
            break
        }
        
        // Print the last row from the remaining rows
        for i in l..<n {
            result.append(arr[m - 1][i])
            cnt += 1
        }
        m -= 1
        
        if cnt == total {
            break
        }
        
        // Print the last column from the remaining columns
        if k < m {
            for i in (k..<m).reversed() {
                result.append(arr[i][n - 1])
                cnt += 1
            }
            n -= 1
        }
        
        if cnt == total {
            break
        }
        
        // Print the first row from the remaining rows
        if l < n {
            for i in (l..<n).reversed() {
                result.append(arr[k][i])
                cnt += 1
            }
            k += 1
        }
    }
    return result
}

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

    func test0() {
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
    
    func test1() {
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
    func test2() {
        let input: [[Int]] = [[1, 2, 3],
                              [4, 5, 6],
                              [7, 8, 9]]
        let output: [Int] = [1, 4, 7, 8, 9, 6, 3, 2, 5]
        
        var result: [Int] = []
        
        measure {
            result = solution(matrix: input)
        }
        
        XCTAssertEqual(result, output)
    }
    
    func test3() {
        let input: [[Int]] = [[1, 2],
                              [3, 4]]
        let output: [Int] = [1, 3, 4, 2]
        
        var result: [Int] = []
        
        measure {
            result = solution(matrix: input)
        }
        
        XCTAssertEqual(result, output)
    }
    
    func test4() {
        let input: [[Int]] = [[1]]
        let output: [Int] = [1]
        
        var result: [Int] = []
        
        measure {
            result = solution(matrix: input)
        }
        
        XCTAssertEqual(result, output)
    }
    
    func test5() {
        let input: [[Int]] = []
        let output: [Int] = []
        
        var result: [Int] = []
        
        measure {
            result = solution(matrix: input)
        }
        
        XCTAssertEqual(result, output)
    }
}

Tests.defaultTestSuite.run()
