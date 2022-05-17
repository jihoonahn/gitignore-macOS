// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Service",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Service",
            targets: ["Service"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
        .package(url: "https://github.com/Moya/Moya.git", .branchItem("master")),
        .package(url: "https://github.com/CombineCommunity/CombineRealm", .branchItem("master"))
    ],
    targets: [
        .target(
            name: "Service",
            dependencies: [
                "Swinject",
                "Moya",
                "CombineRealm"
            ]),
    ]
)
