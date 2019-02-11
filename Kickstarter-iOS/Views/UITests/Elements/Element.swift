import XCTest

protocol Element {
  var uiElement: XCUIElement { get }
}

extension Element {
  var fullyVisible: Bool {
    guard self.uiElement.exists && !self.uiElement.frame.isEmpty else {
      return false
    }
    let mainWindow = XCUIApplication().windows.element(boundBy: 0)
    return mainWindow.frame.contains(self.uiElement.frame)
  }
}

protocol RawElement: Element {
  var type: XCUIElement.ElementType { get }
  var parent: XCUIElement { get }
}

extension RawElement {
  var uiElement: XCUIElement {
    return self.parent.descendants(matching: self.type).element
  }
}

protocol IdentifiableElement: RawElement {
  var accessibilityIdentifier: String { get }
}

extension IdentifiableElement {
  var uiElement: XCUIElement {
    return self.parent
      .descendants(matching: self.type)
      .matching(identifier: self.accessibilityIdentifier)
      .element
  }
}
