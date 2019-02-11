import XCTest

final class TestObserver: NSObject, XCTestObservation {

  static var currentTestCase: XCTestCase?

  override init() {
    super.init()
    XCTestObservationCenter.shared.addTestObserver(self)
  }

  func testCaseWillStart(_ testCase: XCTestCase) {
    TestObserver.currentTestCase = testCase
    Waiter.resetTimeoutToDefault()
  }

  func testCaseDidFinish(_ testCase: XCTestCase) {
    TestObserver.currentTestCase = nil
  }
}
