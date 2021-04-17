import UIKit

extension UIView {
    public func fillSuperview() {
        guard let superview = superview else { return }

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            superview.trailingAnchor.constraint(equalTo: trailingAnchor),
            superview.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
