// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitignoreMain",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "gitignoreMain",
            targets: ["gitignoreMain"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", branch: "main"),
        .package(url: "https://github.com/realm/realm-swift", branch: "master"),
        .package(path: "../Platform"),
        .package(path: "../Service")
    ],
    targets: [
        .target(
            name: "gitignoreMain",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "gitignoreView", package: "Platform"),
                .product(name: "gitignoreLocal", package: "Service"),
                .product(name: "gitignoreAPI", package: "Service"),
                .product(name: "gitignoreService", package: "Service"),
                .product(name: "Realm", package: "realm-swift"),
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "UIUtil", package: "Platform")
            ]),
        .testTarget(
            name: "gitignoreMainTests",
            dependencies: ["gitignoreMain"]),
    ]
)
