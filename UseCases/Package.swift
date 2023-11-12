// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "UseCases",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "UseCases",
            targets: [
                "UseCases"
            ])
    ],
    dependencies: [
        .package(url: "https://github.com/CarlFunk/Dependency", from: Version(0, 1, 0)),
        .package(path: "./Data"),
        .package(path: "./Domain")
    ],
    targets: [
        .target(
            name: "UseCases",
            dependencies: [
                .product(
                    name: "Data",
                    package: "Data"),
                .product(
                    name: "Dependency",
                    package: "Dependency"),
                .product(
                    name: "Domain",
                    package: "Domain")
            ])
    ]
)
