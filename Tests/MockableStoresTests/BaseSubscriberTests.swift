//
//  BaseSubscriberTests.swift
//  
//
//  Created by Andrea Sacerdoti on 20/04/21.
//

import XCTest
import Combine
@testable import MockableStores

@available(iOS 13.0, *)
final class BaseSubscriberTests: XCTestCase {

  class ExampleSubscriber: NSObject, BaseSubscriber {
    @objc dynamic var object: String
    var subscription: Subscription? {
      didSet {
        hasSubscription = subscription != nil
      }
    }

    @objc dynamic var hasSubscription = false

    init(object: String) {
      self.object = object
    }
  }

  func testSubscription() throws {
    let exampleSubscriber = ExampleSubscriber(object: "Test")
    let subscriptionExpectation = XCTKVOExpectation(keyPath: "hasSubscription", object: exampleSubscriber, expectedValue: true)
    let objectExpectation = XCTKVOExpectation(keyPath: "object", object: exampleSubscriber, expectedValue: "Test2")

    Just("Test2")
      .setFailureType(to: Error.self)
      .subscribe(exampleSubscriber)

    wait(for: [subscriptionExpectation, objectExpectation], timeout: 2)
  }
}
