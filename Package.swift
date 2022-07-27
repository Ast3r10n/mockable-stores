// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "mockable-stores",
  platforms: [.iOS(.v11), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
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
