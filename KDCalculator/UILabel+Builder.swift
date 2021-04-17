import UIKit

extension UILabel {
    static func calculatorLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 80, weight: .light)
        label.textColor = UIColor.white
        label.text = "0"
        return label
    }
}
