import XCTest

func assertExists(_ element: Element,
                  message: String? = nil,
                  file: StaticString = #file,
                  line: UInt = #line) {

  XCTAssertTrue(element.uiElement.exists,
                message ?? "Could not find element \(element.uiElement.debugDescription)",
                file: file,
                line: line)
}

func assertFullyVisible(_ element: Element,
                        message: String? = nil,
                        file: StaticString = #file,
                        line: UInt = #line) {

  XCTAssertTrue(element.fullyVisible,
                message ?? "Could not find element \(element.uiElement.debugDescription)",
                file: file,
                line: line)
}
