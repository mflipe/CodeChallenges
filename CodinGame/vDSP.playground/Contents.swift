import Accelerate
import XCTest
 
let vetor1 = Array(stride(from: 0.0, to: 50000.0, by: 1))
let vetor2 = Array(stride(from: 0.0, to: 50000.0, by: 1))
let vetor3 = Array(stride(from: 0.0, to: 50000.0, by: 1))
 
class MeusTestes: XCTestCase {
    func testeSomaEMultiplicaSwifty() {
        measure {
            let _ = vetor1.enumerated().map { ($0.element + vetor2[$0.offset]) * vetor3[$0.offset] }
        }
    }
    func testeSomaEMultiplicaVDSP () {
        measure {
            let _ = vDSP.multiply(addition: (vetor1, vetor2), vetor3)
        }
    }
}

MeusTestes.defaultTestSuite.run()

// average: 0.138 [0.171077, 0.134611, 0.137162, 0.134960, 0.134564, 0.135183, 0.135341, 0.134664, 0.134086, 0.132476]
// average: 0.000 [0.001835, 0.000088, 0.000069, 0.000064, 0.000065, 0.000069, 0.000072, 0.000065, 0.000065, 0.000064]

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result: Int = Int.min
        
        let _ = nums.reduce(into: 0) { acumulador, valor in
            acumulador = acumulador + valor
            result = max(result, acumulador)
            acumulador = max(0, acumulador)
        }
    
        return result
    }
}
