import UIKit

public final class KeypadButton: UIButton {
    
    public enum Kind {
        case operation
        case primary
        case secondary
    }
    
    public var kind: Kind = .primary {
        didSet {
            guard kind != oldValue else { return }
            updateUI()
        }
    }
    
    public init(text: String, kind: Kind) {
        super.init(frame: .zero)
        self.kind = kind
        setTitle(text, for: .normal)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
    
    /// Runs once upon initialization.
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        updateUI()
    }
    
    private func updateUI() {
        titleLabel?.font = .systemFont(ofSize: 24, weight: .light)

        switch kind {
        case .primary:
            backgroundColor = UIColor.gray
            setTitleColor(UIColor.white, for: .normal)
            setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .highlighted)
        case .secondary:
            backgroundColor = UIColor.lightGray
            setTitleColor(UIColor.black, for: .normal)
            setTitleColor(UIColor.black.withAlphaComponent(0.3), for: .highlighted)
        case .operation:
            backgroundColor = UIColor.orange
            setTitleColor(UIColor.white, for: .normal)
            setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .highlighted)
        }
    }
}
