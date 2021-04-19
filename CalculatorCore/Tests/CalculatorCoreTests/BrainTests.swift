import XCTest
import CalculatorCore

final class BrainTests: XCTestCase {
    func testInputNumber() {
        var brain = Brain()
        // Default displayed text should be "0"
        XCTAssertEqual(brain.displayText, "0")

        // Input of "0" when it's already "0" is ignored.
        brain.input(.number(0))
        brain.input(.number(0))
        XCTAssertEqual(brain.displayText, "0")

        brain.input(.number(1))
        XCTAssertEqual(brain.displayText, "1")

        brain.input(.number(2))
        XCTAssertEqual(brain.displayText, "12")

        brain.input(.number(3))
        XCTAssertEqual(brain.displayText, "123")
    }

    func testInputDot() {
        var brain = Brain()
        brain.input(.number(1))
        brain.input(.number(2))
        brain.input(.number(3))
        brain.input(.dot)
        XCTAssertEqual(brain.displayText, "123.")
        
        brain.input(.dot)
        XCTAssertEqual(brain.displayText, "123.")
    }

    func testAdditionOperation() {
        var brain = Brain()
        inputOneThousand(on: &brain)
        XCTAssertEqual(brain.displayText, "1000")

        brain.assign(.addition)
        XCTAssertEqual(brain.displayText, "1000")

        inputTwoHundred(on: &brain)
        XCTAssertEqual(brain.displayText, "200")

        brain.execute()
        XCTAssertEqual(brain.displayText, "1200")
    }

    func testSubtractionOperation() {
        var brain = Brain()
        inputOneThousand(on: &brain)
        XCTAssertEqual(brain.displayText, "1000")

        brain.assign(.subtraction)
        XCTAssertEqual(brain.displayText, "1000")

        inputTwoHundred(on: &brain)
        XCTAssertEqual(brain.displayText, "200")

        brain.execute()
        XCTAssertEqual(brain.displayText, "800")
    }

    func testMultiplicationOperation() {
        var brain = Brain()
        inputOneThousand(on: &brain)
        XCTAssertEqual(brain.displayText, "1000")

        brain.assign(.multiplication)
        XCTAssertEqual(brain.displayText, "1000")

        inputTwoHundred(on: &brain)
        XCTAssertEqual(brain.displayText, "200")

        brain.execute()
        XCTAssertEqual(brain.displayText, "200000")
    }

    func testDivisionOperation() {
        var brain = Brain()
        inputOneThousand(on: &brain)
        XCTAssertEqual(brain.displayText, "1000")

        brain.assign(.division)
        XCTAssertEqual(brain.displayText, "1000")

        inputTwoHundred(on: &brain)
        XCTAssertEqual(brain.displayText, "200")

        brain.execute()
        XCTAssertEqual(brain.displayText, "5")
    }

    func testConsecutiveOperation() {
        var brain = Brain()
        inputOneThousand(on: &brain)
        brain.perform(.negation)
        XCTAssertEqual(brain.displayText, "-1000")
        brain.assign(.addition)
        inputTwoHundred(on: &brain)
        brain.execute()
        XCTAssertEqual(brain.displayText, "-800")
    }

    func testClear() {
        var brain = Brain()
        inputOneThousand(on: &brain)
        brain.clear()
        XCTAssertEqual(brain.displayText, "0")
    }

    private func inputOneThousand(on brain: inout Brain) {
        brain.input(.number(1))
        brain.input(.number(0))
        brain.input(.number(0))
        brain.input(.number(0))
    }

    private func inputTwoHundred(on brain: inout Brain) {
        brain.input(.number(2))
        brain.input(.number(0))
        brain.input(.number(0))
    }
}
