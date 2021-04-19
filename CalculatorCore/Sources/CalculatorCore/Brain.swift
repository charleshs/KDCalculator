import Foundation

public struct Brain {
    public private(set) var displayText: String = .cleared

    private var acceptsNextValue: Bool = false
    private var error: Error?
    private var memory: Decimal?
    private var operation: Action.DuoOperation?

    public init() {}

    public mutating func input(_ input: Action.Input) {
        let aString: String

        switch input {
        case .number(let number):
            guard (0 ..< 10).contains(number) else { return }
            aString = "\(number)"
        case .dot:
            aString = "."
        }

        if acceptsNextValue {
            displayText.reset()
        }
        if displayText == .cleared {
            displayText.removeAll()
        }
        if aString == ".", displayText.last == "." {
            return
        }
        displayText.append(aString)
        acceptsNextValue = false
    }

    public mutating func assign(_ operation: Action.DuoOperation) {
        guard let inputValue = Decimal(string: displayText) else { return }

        self.operation = operation
        memory = inputValue
        acceptsNextValue = true
    }

    public mutating func perform(_ operation: Action.SoloOperation) {
        guard let inputValue = Decimal(string: displayText) else { return }

        switch operation {
        case .percentage:
            displayText = "\(inputValue * 100)"
        case .negation:
            displayText = "\(-inputValue)"
        }
    }

    public mutating func execute() {
        guard let inputValue = Decimal(string: displayText) else { return }

        let memory = self.memory ?? 0
        var result: Decimal?
        switch operation {
        case .addition:
            result = memory + inputValue
        case .subtraction:
            result = memory - inputValue
        case .multiplication:
            result = memory * inputValue
        case .division:
            guard inputValue != 0 else {
                return self.error = CalculatorError.dividedByZero
            }
            result = memory / inputValue
        default:
            break
        }

        if let text = result.map({ "\($0)" }) ?? nil {
            displayText = text
        }
        acceptsNextValue = true
    }

    public mutating func clear() {
        acceptsNextValue = false
        displayText.reset()
        memory = 0
        operation = nil
    }
}
