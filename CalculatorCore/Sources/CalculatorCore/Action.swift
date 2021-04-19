import Foundation

public enum Action {
    public enum Input {
        case number(Int)
        case dot
    }

    public enum DuoOperation {
        case addition
        case subtraction
        case multiplication
        case division
    }

    public enum SoloOperation {
        case negation
        case percentage
    }
}
