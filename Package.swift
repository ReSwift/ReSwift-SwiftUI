// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ReSwiftSwiftUI",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v7),
        .tvOS(.v14)
    ],
    products: [
      .library(name: "ReSwiftSwiftUI", targets: ["ReSwiftSwiftUI"])
    ],
    dependencies: [
      .package(url: "https://github.com/ReSwift/ReSwift", .upToNextMajor(from: "6.0.0"))
    ],
    targets: [
      .target(
        name: "ReSwiftSwiftUI",
        dependencies: [
          "ReSwift"
        ],
        path: "Sources"
      ),
      .testTarget(
        name: "ReSwiftSwiftUITests",
        dependencies: ["ReSwiftSwiftUI"],
        path: "Tests"
      )
    ]
)
