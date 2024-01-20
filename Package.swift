// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "mockable-stores",
  platforms: [.iOS(.v12), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v9)],
  products: [
    .library(
      name: "MockableStores",
      targets: ["MockableStores"]),
  ],
  targets: [
    .target(
      name: "MockableStores",
      dependencies: []),
    .testTarget(
      name: "MockableStoresTests",
      dependencies: ["MockableStores"]),
  ]
)
