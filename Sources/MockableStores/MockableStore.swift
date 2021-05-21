//
//  MockableStore.swift
//  
//
//  Created by Andrea Sacerdoti on 16/04/21.
//

import Foundation
import Combine

public protocol MockableStore: BaseSubscriber {
  associatedtype MockableType: Mockable
  var object: MockableType { get set }
}

extension MockableStore {
  #if DEBUG || TEST
  public var mockPublisher: AnyPublisher<MockableType, Error> {
    Just(MockableType.mock)
      .setFailureType(to: Error.self)
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
  #endif
}
