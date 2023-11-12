// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Screens",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Screens",
            targets: ["Screens"])
    ],
    dependencies: [
        .package(path: "./Domain"),
        .package(path: "./UI"),
        .package(path: "./UseCases")
    ],
    targets: [
        .target(
            name: "Screens",
            dependencies: [
                .product(
                    name: "Domain",
                    package: "Domain"),
                .product(
                    name: "UI",
                    package: "UI"),
                .product(
                    name: "UseCases",
                    package: "UseCases")
            ])
    ]
)
