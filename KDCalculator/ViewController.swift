import UIKit

final class ViewController: UIViewController {
    
    private let keypadView = CalculatorKeypadView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    /// Runs once after `super.viewDidLoad()`
    private func setup() {
        keypadView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keypadView)
        NSLayoutConstraint.activate([
            keypadView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: keypadView.trailingAnchor, constant: 16),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: keypadView.bottomAnchor, constant: 16),
        ])
    }
}
