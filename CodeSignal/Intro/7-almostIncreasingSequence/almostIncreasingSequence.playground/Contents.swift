/* MARK: - The Goal
 Given a sequence of integers as an array,
 determine whether it is possible to obtain a strictly increasing sequence
 by removing no more than one element from the array.

 Note: sequence a0, a1, ..., an is considered to be a strictly increasing if a0 < a1 < ... < an.
 Sequence containing only one element is also considered to be strictly increasing.
 
 Example

 For sequence = [1, 3, 2, 1], the output should be
 solution(sequence) = false.

 There is no one element in this array that can be removed in order to get a strictly increasing sequence.

 For sequence = [1, 3, 2], the output should be
 solution(sequence) = true.

 You can remove 3 from the array to get the strictly increasing sequence [1, 2].
 Alternately, you can remove 2 to get the strictly increasing sequence [1, 3].
 
 Input/Output

 [execution time limit] 0.5 seconds (cs)

 [input] array.integer sequence

 Guaranteed constraints:
 2 ≤ sequence.length ≤ 105,
 -105 ≤ sequence[i] ≤ 105.

 [output] boolean

 Return true if it is possible to remove one element from
 the array in order to get a strictly increasing sequence,
 otherwise return false
  
 */
// MARK: The Goal

/* MARK: - Default Code

 */// MARK: Default Code

// MARK: - Imports
import Foundation
import XCTest

// MARK: - Solution 1

// 1.200
/*
func solution(sequence: [Int]) -> Bool {
    let s1 = zip(sequence.dropLast(), sequence.dropFirst()).map({$0.0 >= $0.1}).filter{ $0 }.count <= 1
    let s2 = zip(sequence.dropLast(2), sequence.dropFirst(2)).map({$0.0 >= $0.1}).filter{ $0 }.count <= 1
    return s1 && s2
}
*/


// MARK: - Solution 2
// 0.600 ~ 0.700
/*
func solution(sequence: [Int]) -> Bool {
    var strikes: Int = 0, firstMax: Int = Int.min, secondMax: Int = Int.min
    
    for currentValue in sequence {
        if strikes >= 2 {
            break
        }
        
        if currentValue > firstMax {
            secondMax = firstMax
            firstMax = currentValue
            continue
        }
        
        if currentValue > secondMax {
            firstMax = currentValue
            strikes += 1
            continue
        }
        
        strikes += 1
    }
    
    return strikes < 2
}
*/

// MARK: - Solution 3
// 0.600 ~ 0.700
func solution(sequence: [Int]) -> Bool {
    // recursivo
    return true
}

// MARK: - Test Cases
struct testInput: Decodable {
    let sequence: [Int]
    let output: Bool
}

var inputs: [testInput] = []

func getJson() {
    do {
        guard let fileUrl = Bundle.main.url(forResource: "tests", withExtension: "json") else { fatalError() }
        let text: String = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)

        let decoder = JSONDecoder()
        
        let jsonData: Data = Data(text.utf8)
        inputs = try decoder.decode([testInput].self, from: jsonData)
        
    } catch {
        print(error)
    }
}

getJson()


class Tests: XCTestCase {

    var input: [testInput] = []
    var output: Int = 0

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
        for input in inputs {
            let result = solution(sequence: input.sequence)
            XCTAssertEqual(result, input.output)
        }
    }
    
    func test2() {
        measure {
            for input in inputs {
                solution(sequence: input.sequence)
            }
        }
    }

}

Tests.defaultTestSuite.run()
