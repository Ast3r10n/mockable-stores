//
//  MockableTests.swift
//  
//
//  Created by Andrea Sacerdoti on 20/04/21.
//

import XCTest
@testable import MockableStores

final class MockableTests: XCTestCase {
  func testArrayMock() throws {
    struct MockableObject: Mockable, ListMockable, Equatable {
      var name: String

      static var mock: Self {
        .init(name: "TestObject")
      }

      static var mockList: [MockableObject] {
        [.mock]
      }

      init(name: String) {
        self.name = name
      }
    }

    XCTAssertEqual([MockableObject.mock], .mock)
  }
}
