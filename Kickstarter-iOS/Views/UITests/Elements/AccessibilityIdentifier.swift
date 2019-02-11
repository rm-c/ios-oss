import Foundation

protocol AccessibilityIdentifiable {
  var accessibilityIdentifier: String { get }
}

public enum AccessibilityIdentifier: String {

  // login/signup
  case done = "Log in"
  case loginOrSignup = "Sign up or Log in"
  case email = "Log in with email"
  case emailTextField = "email_textfield"
  case passwordTextField = "password_textfield"
  case signupButton = "Sign up with email"

  case disclaimer = "disclaimer_button"
  case facebook = "facebook_login_button"
  case login = "login_button"
  case signup = "signup_button"

  case loginView = "login_view"
  case signupView = "signup_view"
}

extension AccessibilityIdentifier: AccessibilityIdentifiable {
  var accessibilityIdentifier: String {
    return self.rawValue
  }
}
