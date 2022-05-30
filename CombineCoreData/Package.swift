// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CombineCoreData",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "CombineCoreData",
            targets: ["CombineCoreData"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CombineCoreData",
            dependencies: []),
    ]
)
