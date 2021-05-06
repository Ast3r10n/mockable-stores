//
//  MockableStoreTests.swift
//  
//
//  Created by Andrea Sacerdoti on 20/04/21.
//

import XCTest
import Combine
@testable import MockableStores

final class MockableStoreTests: XCTestCase {

  var cancellables: [AnyCancellable] = []

  override func setUp() {
    super.setUp()
    cancellables = []
  }

  class ExampleMockableStore: MockableStore {

    final class MockableObject: NSObject, Mockable {
      @objc dynamic var name: String

      static var mock: MockableObject {
        MockableObject(name: "Test2")
      }

      init(name: String) {
        self.name = name
      }
    }

    var object: MockableObject
    var subscription: Subscription?

    init(object: MockableObject) {
      self.object = object
    }
  }

  func testMockPublisher() throws {
    let exampleStore = ExampleMockableStore(object: .init(name: "Test"))
    let objectExpectation = XCTKVOExpectation(keyPath: "name", object: exampleStore.object, expectedValue: "Test2")

    exampleStore.mockPublisher
      .sink { completion in
        switch completion {
        case .failure(let error):
          XCTFail(error.localizedDescription)
          fallthrough
        default:
          break
        }
      } receiveValue: { value in
        exampleStore.object.name = value.name
      }
      .store(in: &cancellables)

    wait(for: [objectExpectation], timeout: 2)
  }
}

