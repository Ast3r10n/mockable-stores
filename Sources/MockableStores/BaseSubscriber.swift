//
//  BaseSubscriber.swift
//  
//
//  Created by Andrea Sacerdoti on 20/04/21.
//

import Foundation
import Combine

public protocol BaseSubscriber: ObservableObject, Subscriber {
  associatedtype ObjectType
  var object: ObjectType { get set }
  var subscription: Subscription? { get set }
}

// MARK: -
extension BaseSubscriber {
  public func receive(subscription: Subscription) {
    self.subscription = subscription
    self.subscription?.request(.unlimited)
  }

  public func receive(_ input: ObjectType) -> Subscribers.Demand {
    object = input
    return .none
  }

  public func receive(completion: Subscribers.Completion<Error>) {
    debugPrint("\(ObjectType.self) Subscription", completion, separator: ": ")
  }
}
