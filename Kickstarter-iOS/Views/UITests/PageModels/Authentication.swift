import Foundation

final class Authentication: Page {

  enum Mode {
    case login
    case signup
  }

  convenience init(mode: Mode) {
    let identifier: AccessibilityIdentifier
    switch mode {
    case .login:
      identifier = .loginView
    case .signup:
      identifier = .signupView
    }
    self.init(identifier: identifier)
  }

  fileprivate var usernameTextField: TextField {
    return StandardTextField(parent: self, identifier: .emailTextField)
  }

  fileprivate var passwordTextField: TextField {
    return SecureTextField(parent: self, identifier: .passwordTextField)
  }

  fileprivate var doneButton: Button {
    return Button(parent: self, identifier: .done)
  }
}

extension Authentication {
  func enterCredentials(username: String,
                        password: String,
                        file: StaticString = #file,
                        line: UInt = #line) -> Self {
    self.usernameTextField.typeText(username)
    self.passwordTextField.typeText(password)
    self.doneButton.tap()
    return self
  }
}
