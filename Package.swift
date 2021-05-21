// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MockableStores",
  platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
  products: [
    .library(
      name: "MockableStores",
      targets: ["MockableStores"]),
  ],
  targets: [
    .target(
      name: "MockableStores",
      dependencies: [],
      swiftSettings: [
        .define("TEST", .when(configuration: .debug))
      ]),
    .testTarget(
      name: "MockableStoresTests",
      dependencies: ["MockableStores"],
      swiftSettings: [
        .define("TEST", .when(configuration: .debug))
      ]),
  ]
)
