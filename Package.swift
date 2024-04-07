// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIComponents",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftUIComponents",
            targets: ["SwiftUIComponents"]),
    ],
    dependencies: [
        .package(url: "https://github.com/josephchang10/TailwindSwiftUI", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftUIComponents",
            dependencies: [
                .product(name: "TailwindSwiftUI", package: "TailwindSwiftUI")
            ],
            resources: [.process("Assets.xcassets")]
        ),
        .testTarget(
            name: "SwiftUIComponentsTests",
            dependencies: ["SwiftUIComponents"]),
    ]
)
