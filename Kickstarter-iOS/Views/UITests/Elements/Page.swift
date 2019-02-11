import Foundation
import XCTest

class Page: IdentifiableElement {
  let type: XCUIElement.ElementType = .other
  let parent: XCUIElement = XCUIApplication()
  let accessibilityIdentifier: String

  internal init(accessibilityIdentifier: String) {
    self.accessibilityIdentifier = accessibilityIdentifier
  }

  convenience init(identifier: AccessibilityIdentifier) {
    self.init(accessibilityIdentifier: identifier.rawValue)
  }
}
