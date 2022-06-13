// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitignoreList",
    defaultLocalization: "en",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "gitignoreList",
            targets: ["gitignoreList"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", branch: "main"),
        .package(url: "https://github.com/realm/realm-swift", branch: "master"),
        .package(path: "../Platform"),
        .package(path: "../Service")
    ],
    targets: [
        .target(
            name: "gitignoreList",
            dependencies: [
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "gitignoreView", package: "Platform"),
                .product(name: "WaterfallGrid", package: "Platform"),
                .product(name: "UIUtil", package: "Platform"),
                .product(name: "FoundationUtil", package: "Platform"),
                .product(name: "gitignoreLocal", package: "Service"),
                .product(name: "gitignoreService", package: "Service")
            ],
            resources: [
                .process("Localization")
            ]
        ),

        .testTarget(
            name: "gitignoreListTests",
            dependencies: ["gitignoreList"]),
    ]
)
