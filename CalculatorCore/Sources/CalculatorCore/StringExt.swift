import Foundation

extension String {
    /// CalculatorCore: "0"
    static var cleared: String = "0"

    /// Sets self to "0"
    mutating func reset() {
        self = .cleared
    }
}
