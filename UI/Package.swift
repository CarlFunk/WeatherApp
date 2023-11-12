// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UI",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "UI",
            targets: [
                "UI"
            ])
    ],
    dependencies: [
        .package(path: "./Domain"),
        .package(path: "./UseCases")
    ],
    targets: [
        .target(
            name: "UI",
            dependencies: [
                .product(
                    name: "Domain",
                    package: "Domain"),
                .product(
                    name: "UseCases",
                    package: "UseCases")
            ])
    ]
)
