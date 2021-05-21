//
//  Mockable.swift
//  
//
//  Created by Andrea Sacerdoti on 16/04/21.
//

/// A protocol requiring a conforming object to contain a `mock` property.
///
/// The `mock` property is to be used from within tests.
public protocol Mockable {
  #if DEBUG || TEST
  static var mock: Self { get }
  #endif
}

public protocol ListMockable {
  #if DEBUG || TEST
  static var mockList: [Self] { get }
  #endif
}

extension Array: Mockable where Element: ListMockable {
  #if DEBUG || TEST
  public static var mock: [Element] {
    Element.mockList
  }
  #endif
}
