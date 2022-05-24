// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Platform",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "gitignoreView",
            targets: ["gitignoreView"]),
        .library(
            name: "FoundationUtil",
            targets: ["FoundationUtil"]),
        .library(
            name: "UIUtil",
            targets: ["UIUtil"]),
        .library(
            name: "WaterfallGrid",
            targets: ["WaterfallGrid"]),
        .library(
            name: "TagListView",
            targets: ["TagListView"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "gitignoreView",
            dependencies: []),
        .target(
            name: "FoundationUtil",
            dependencies: []),
        .target(
            name: "UIUtil",
            dependencies: []),
        .target(
            name: "WaterfallGrid",
            dependencies: []),
        .target(
            name: "TagListView",
            dependencies: [
                "FoundationUtil",
            ]),
    ]
)
