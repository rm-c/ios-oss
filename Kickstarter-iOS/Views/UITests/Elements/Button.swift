import Foundation
import XCTest

class Button: IdentifiableElement {
  let type: XCUIElement.ElementType = .button
  let accessibilityIdentifier: String
  let parent: XCUIElement

  init(parent: Element, accessibilityIdentifier: String) {
    self.parent = parent.uiElement
    self.accessibilityIdentifier = accessibilityIdentifier
  }

  convenience init(parent: Element, identifier: AccessibilityIdentifier) {
    self.init(parent: parent, accessibilityIdentifier: identifier.rawValue)
  }
}

extension Button {
  func tap() {
    self.uiElement.tap()
  }
}
