import Foundation
import XCTest

protocol TextField: IdentifiableElement {
  func typeText(_ text: String)
}

extension TextField {

  func typeText(_ text: String) {
    self.uiElement.tap()
    self.uiElement.typeText(text)
  }
}

final class StandardTextField: TextField {

  let type: XCUIElement.ElementType = .textField
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

final class SecureTextField: TextField {

  let type: XCUIElement.ElementType = .secureTextField
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
