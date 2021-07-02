//
//  MockableStore.swift
//  
//
//  Created by Andrea Sacerdoti on 16/04/21.
//

import Foundation
#if canImport(Combine)
import Combine
#endif

@available(iOS 13.0, *)
public protocol MockableStore: BaseSubscriber {
  associatedtype MockableType: Mockable
  var object: MockableType { get set }
}

@available(iOS 13.0, *)
extension MockableStore {
  #if DEBUG
  public var mockPublisher: AnyPublisher<MockableType, Error> {
    Just(MockableType.mock)
      .setFailureType(to: Error.self)
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
  #endif
}
