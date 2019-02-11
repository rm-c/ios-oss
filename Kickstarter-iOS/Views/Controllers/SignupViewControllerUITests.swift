import XCTest
@testable import KsApi
@testable import Library
@testable import Kickstarter_Framework

class SignupViewControllerUITests: XCTestCase {

  private var app: XCUIApplication!
  private let username = "therealnativesquad@gmail.com"
  private let password = "usertest"

  override func setUp() {
    self.app = XCUIApplication()
    self.app.launch()
  }

  override func tearDown() {
    self.app = nil
  }

  func testExample() throws {

    let loginSignupButton = self.app.loginButton
    self.wait(for: loginSignupButton)
    self.app.tapSignupButton()

    let auth = AuthScreen(accessibilityIdentifier: "login_tout_view")
    _ = try auth.tapLoginButton()
          .enterCredentials(username: "test", password: "123456")

//    let loginEmailButton = self.app.loginEmailButton
//    self.wait(for: loginEmailButton)
//    self.app.tapLoginWithEmail()
//
//    let emailTextField = self.app.emailTextField
//    self.wait(for: emailTextField)
//    self.app.typeEmail()
//
//    let passwordTextField = self.app.passwordTextField
//    self.wait(for: passwordTextField)
//    self.app.typePassword()
//
//    let doneButton = self.app.doneButton
//    self.wait(for: doneButton)
//    self.app.tapLogin()

  }
}

extension XCTestCase {
  func wait(for element: XCUIElement, timeout: TimeInterval = 5) {
    let predicate = NSPredicate(format: "exists == 1")
    expectation(for: predicate, evaluatedWith: element)
    waitForExpectations(timeout: timeout)
  }
}

class Ksr_Page {

  let element: XCUIElement

  init(element: XCUIElement) {
    self.element = element
  }
}

class UIElementPage<E: UIElement>: Ksr_Page {

  override init(element: XCUIElement) {
    super.init(element: element)
  }

  func label(_ element: E) -> XCUIElement {
    return self.element.staticTexts[element.accessibilityIdentifier]
  }

  func textField(_ element: E) -> XCUIElement {
    return self.element.textFields[element.accessibilityIdentifier]
  }

  func secureTextField(_ element: E) -> XCUIElement {
    return self.element.secureTextFields[element.accessibilityIdentifier]
  }

  func button(_ element: E) -> XCUIElement {
    return self.element.buttons[element.accessibilityIdentifier]
  }
}

protocol UIElement {
  var accessibilityIdentifier: String { get }
}

extension UIElement where Self: RawRepresentable {

  var accessibilityIdentifier: RawValue {
    return self.rawValue
  }
}

enum Elements {

  enum Pages {

    enum AuthPage: String, UIElement {
      case disclaimer = "disclaimer_button"
      case facebook = "facebook_login_button"
      case login = "login_button"
      case signup = "signup_button"
    }
  }
}

























extension XCUIApplication {

  var loginButton: XCUIElement {
    return self.buttons.matching(identifier: AccessibilityIdentifier.loginOrSignup.rawValue).element
  }

  var loginEmailButton: XCUIElement {
    return self.buttons.matching(identifier: AccessibilityIdentifier.email.rawValue).element
  }

  var emailTextField: XCUIElement {
    return self.textFields.matching(identifier: AccessibilityIdentifier.emailTextField.rawValue).element
  }

  var passwordTextField: XCUIElement {
    return self.secureTextFields.matching(
      identifier: AccessibilityIdentifier.passwordTextField.rawValue
    ).element
  }

  var doneButton: XCUIElement {
    return self.buttons.matching(identifier: AccessibilityIdentifier.done.rawValue).element
  }

  func tapSignupButton() {
    self.loginButton.tap()
  }

  func tapLoginWithEmail() {
    self.loginEmailButton.tap()
  }

  func typeEmail() {
    self.emailTextField.typeText("ksr@test.com")
  }

  func typePassword() {
    self.passwordTextField.typeText("123456")
  }

  func tapLogin() {
    self.doneButton.tap()
  }
}
