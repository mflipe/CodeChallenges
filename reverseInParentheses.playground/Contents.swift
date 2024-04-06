/* MARK: - The Goal
 Write a function that reverses characters in (possibly nested) parentheses in the input string.

 Input strings will always be well-formed with matching ()s.

 Example

 For inputString = "(bar)",
 the output should be solution(inputString) = "rab";
 
 For inputString = "foo(bar)baz",
 the output should be solution(inputString) = "foorabbaz";
 
 For inputString = "foo(bar)baz(blim)",
 the output should be solution(inputString) = "foorabbazmilb";
 
 For inputString = "foo(bar(baz))blim",
 the output should be solution(inputString) = "foobazrabblim".
 
 Because "foo(bar(baz))blim" becomes "foo(barzab)blim" and then "foobazrabblim".
 
 Input/Output

 [execution time limit] 6 seconds (swift)

 [input] string inputString

 A string consisting of lowercase English letters and the characters ( and ). It is guaranteed that all parentheses in inputString form a regular bracket sequence.

 Guaranteed constraints:
 0 ≤ inputString.length ≤ 50.

 [output] string

 Return inputString, with all the characters that were in parentheses reversed.
 */
// MARK: The Goal

// MARK: - Imports
import Foundation
import XCTest

// MARK: - Solution 1
// 1 average: 0.001, [0.003485, 0.000590, 0.000553, 0.000514, 0.000592, 0.000432, 0.000451, 0.000465, 0.000548, 0.000290]
// 2 average: 0.001, [0.005543, 0.000529, 0.000460, 0.000449, 0.000442, 0.000445, 0.000456, 0.000442, 0.000524, 0.000361]
// 3 average: 0.004, [0.010753, 0.003425, 0.003002, 0.003198, 0.002893, 0.002545, 0.002643, 0.002595, 0.002382, 0.002205]

func solution(inputString: String, _ memoria: [String: String] = [:]) -> String {
    var memoria = memoria
    if let cache = memoria[inputString] { return cache }
    
    guard let primeiroParenteses: String.Index = inputString.lastIndex(of: "("),
          let parentesesQueFecha: String.Index = inputString[primeiroParenteses...].firstIndex(of: ")")
    else { return inputString }
    
    let stringASerRevertida: String = String(inputString[primeiroParenteses...parentesesQueFecha])
    let stringRevertida = String(stringASerRevertida.reversed()).dropFirst().dropLast()
    let stringFinal = inputString.replacingOccurrences(of: stringASerRevertida, with: stringRevertida)
    
    memoria[inputString] = stringFinal
    let meuInt: [Int] = []
    meuInt.max()
    
    
    return stringFinal.contains("(") ? solution(inputString: stringFinal, memoria) : stringFinal
}

// MARK: - Solution 2
/*
func solution2(inputString: String) -> String {
    var s = inputString
    while let openIdx = s.lastIndex(of: "(") {
        // Should really use a guard let here, but the problem states that all parens are well formed
        let closeIdx = s[openIdx...].firstIndex(of:")")!
        s.replaceSubrange(openIdx...closeIdx, with: s[s.index(after: openIdx)..<closeIdx].reversed())
    }
    
    return s
}
*/

// MARK: - Solution 3
/*
func solution3(inputString: String) -> String {
    var stack = [Character]()
    
    for c in inputString {
        if c == ")" {
            for e in 0..<stack.count {
                let index = stack.count - 1 - e
                if stack[index] == "(" {
                    stack.remove(at: index)
                    let chunk = stack[index..<stack.count].reversed()
                    stack.removeLast(chunk.count)
                    stack.append(contentsOf: chunk)
                    break
                }
            }
        } else {
            stack.append(c)
        }
    }
    
    return String(stack)
}
*/

// MARK: - Test Cases
class Tests: XCTestCase {

    var input: [String] = ["(bar)",
                           "foo(bar)baz",
                           "foo(bar)baz(blim)",
                           "foo(bar(baz))blim",
                           "",
                           "()",
                           "(abc)d(efg)"]
    
    var output: [String] = ["rab",
                            "foorabbaz",
                            "foorabbazmilb",
                            "foobazrabblim",
                            "",
                            "",
                            "cbadgfe"]
 
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
            for i in input {
                let _ = solution3(inputString: i)
            }
        }
    }
    
    func test2() {
        for i in 0..<input.count {
            let result = solution3(inputString: input[i])
            XCTAssertEqual(result, output[i])
        }
    }
}

Tests.defaultTestSuite.run()
