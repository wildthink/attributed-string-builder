// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "attributed-string-builder",
    platforms: [.macOS(.v15), .iOS(.v17)],
    products: [
        .library(
            name: "AttributedStringBuilder",
            targets: ["AttributedStringBuilder"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-markdown", branch: "main"),
    ],
    targets: [
        .target(
            name: "AttributedStringBuilder",
            dependencies: [
                .product(name: "Markdown", package: "swift-markdown"),
            ]),
        .testTarget(
            name: "Tests",
            dependencies: [
                "AttributedStringBuilder"
//                .product(name: "AttributedStringBuilder"),
            ]),
    ]
)
