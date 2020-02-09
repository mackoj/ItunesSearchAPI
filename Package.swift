// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ItunesSearchAPI",
  products: [
    .library(
      name: "ItunesSearchAPI",
      targets: ["ItunesSearchAPI"]),
  .library(
    name: "ItunesSearchAPIClient",
    targets: ["ItunesSearchAPIClient"]),
  ],
  dependencies: [
  .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.0.1"),
  ],
  targets: [
    .target(
      name: "ItunesSearchAPI",
      dependencies: []),
    .target(
      name: "ItunesSearchAPIClient",
      dependencies: ["ItunesSearchAPI", "AsyncHTTPClient"]),
    .testTarget(
      name: "ItunesSearchAPIClientTests",
      dependencies: ["ItunesSearchAPIClient"]),
  ]
)
