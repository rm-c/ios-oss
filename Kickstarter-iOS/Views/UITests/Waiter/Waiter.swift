import Foundation
import XCTest

struct Waiter {
  static var globalTimeout: TimeInterval = defaultTimeout

  static func resetTimeoutToDefault() {
    globalTimeout = defaultTimeout
  }

  private static let defaultTimeout: TimeInterval = 5
}

enum WaiterError: Error {
  case notFound(element: Element)
}

extension Waiter {
  static func wait<T: Element>(for element: T,
                               timeout: TimeInterval = Waiter.globalTimeout,
                               file: StaticString = #file,
                               line: UInt = #line) throws -> T {
    do {
      try wait(for: element, timeout: timeout)
    } catch {
      TestObserver
        .currentTestCase?
        .recordFailure(withDescription: String(describing: error),
                       inFile: String(describing: file),
                       atLine: Int(line),
                       expected: true)

      throw error
    }

    return element
  }

  private static func wait(for element: Element, timeout: TimeInterval = Waiter.globalTimeout) throws {
    let date = Date()
    let uiElement = element.uiElement
    while Date().timeIntervalSince(date) < timeout {
      if uiElement.exists {
        return
      }
      RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.5))
    }
    throw WaiterError.notFound(element: element)
  }
}

func wait<T: Element>(for element: T,
                      timeout: TimeInterval = Waiter.globalTimeout,
                      file: StaticString = #file,
                      line: UInt = #line) throws -> T {
  return try Waiter.wait(for: element, timeout: timeout, file: file, line: line)
}
