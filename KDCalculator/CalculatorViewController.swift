import UIKit

final class CalculatorViewController: UIViewController {
    private let calculatorLabel = UILabel.calculatorLabel()
    private let keypadView = CalculatorKeypadView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    /// Runs once after `super.viewDidLoad()`
    private func setup() {
        calculatorLabel.translatesAutoresizingMaskIntoConstraints = false
        keypadView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(calculatorLabel)
        view.addSubview(keypadView)

        NSLayoutConstraint.activate([
            calculatorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Layout.labelPadding),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: calculatorLabel.trailingAnchor, constant: Layout.labelPadding),
            keypadView.topAnchor.constraint(equalTo: calculatorLabel.bottomAnchor, constant: Layout.labelKaypadSpacing),

            keypadView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Layout.keypadPadding),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: keypadView.trailingAnchor, constant: Layout.keypadPadding),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: keypadView.bottomAnchor, constant: Layout.keypadPadding),
        ])
    }
}

private enum Layout {
    static let labelPadding: CGFloat = 24
    static let labelKaypadSpacing: CGFloat = 16
    static let keypadPadding: CGFloat = 16
}
