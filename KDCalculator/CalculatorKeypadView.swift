import UIKit
import StackKit

public final class CalculatorKeypadView: UIView {

    private let clearButton = KeypadButton(text: "AC", kind: .secondary)
    private let negateButton = KeypadButton(text: "+/-", kind: .secondary)
    private let percentageButton = KeypadButton(text: "%", kind: .secondary)
    
    private let num0Button = KeypadButton(text: "0", kind: .primary)
    private let num1Button = KeypadButton(text: "1", kind: .primary)
    private let num2Button = KeypadButton(text: "2", kind: .primary)
    private let num3Button = KeypadButton(text: "3", kind: .primary)
    private let num4Button = KeypadButton(text: "4", kind: .primary)
    private let num5Button = KeypadButton(text: "5", kind: .primary)
    private let num6Button = KeypadButton(text: "6", kind: .primary)
    private let num7Button = KeypadButton(text: "7", kind: .primary)
    private let num8Button = KeypadButton(text: "8", kind: .primary)
    private let num9Button = KeypadButton(text: "9", kind: .primary)
    private let dotButton = KeypadButton(text: ".", kind: .primary)

    private let addButton = KeypadButton(text: "+", kind: .operation)
    private let subtractButton = KeypadButton(text: "-", kind: .operation)
    private let multiplyButton = KeypadButton(text: "*", kind: .operation)
    private let divideButton = KeypadButton(text: "/", kind: .operation)
    private let equalButton = KeypadButton(text: "=", kind: .operation)

    private let rootVStack = UIStackView(axis: .vertical, alignment: .fill, distribution: .fillEqually, spacing: 8)

    public init() {
        super.init(frame: .zero)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    /// Runs once upon initialization.
    private func setup() {
        rootVStack.addArrangedSubviews([
            UIStackView.keypadRow(with: [clearButton, negateButton, percentageButton, divideButton]),
            UIStackView.keypadRow(with: [num7Button, num8Button, num9Button, multiplyButton]),
            UIStackView.keypadRow(with: [num4Button, num5Button, num6Button, subtractButton]),
            UIStackView.keypadRow(with: [num1Button, num2Button, num3Button, addButton]),
            UIStackView.keypadRow(with: [num0Button, UIStackView.keypadRow(with: [dotButton, equalButton])])
        ])
        rootVStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rootVStack)
        rootVStack.fillSuperview()

        // Make square buttons
        equalButton.widthAnchor.constraint(equalTo: equalButton.heightAnchor).isActive = true
    }
}

extension UIStackView {

    static func keypadRow(with subviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(axis: .horizontal, alignment: .fill, distribution: .fillEqually, spacing: 8)
        stackView.addArrangedSubviews(subviews)
        return stackView
    }
}
