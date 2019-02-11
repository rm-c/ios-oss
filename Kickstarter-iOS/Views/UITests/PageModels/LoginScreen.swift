import Foundation

class AuthScreen: Page {

  fileprivate var loginButton: Button {
    return Button(parent: self, identifier: .login)
  }

  fileprivate var signupButton: Button {
    return Button(parent: self, identifier: .signup)
  }

  fileprivate var faceboolButton: Button {
    return Button(parent: self, identifier: .facebook)
  }
}

extension AuthScreen {
  func tapLoginButton(file: StaticString = #file, line: UInt = #line) throws -> Authentication {
    self.loginButton.tap()
    return try wait(for: Authentication(mode: .login), file: file, line: line )
  }
}
