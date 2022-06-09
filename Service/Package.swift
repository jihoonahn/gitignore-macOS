// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Service",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "gitignoreAPI",
            targets: ["gitignoreAPI"]),
        .library(
            name: "gitignoreLocal",
            targets: ["gitignoreLocal"]),
        .library(
            name: "gitignoreService",
            targets: ["gitignoreService"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", branch: "main"),
        .package(url: "https://github.com/realm/realm-swift", branch: "master"),
        .package(url: "https://github.com/Swinject/Swinject", branch: "master")
    ],
    targets: [
        .target(
            name: "gitignoreAPI",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]),
        .target(
            name: "gitignoreLocal",
            dependencies: [
                .product(name: "Realm", package: "realm-swift")
            ]),
        .target(
            name: "gitignoreService",
            dependencies: [
                    "gitignoreAPI",
                    "gitignoreLocal",
                    "Swinject",
            ]),
    ]
)
