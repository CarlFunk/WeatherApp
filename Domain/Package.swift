// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Domain",
            targets: [
                "Domain"
            ])
    ],
    dependencies: [
        .package(url: "https://github.com/CarlFunk/Dependency", from: Version(0, 1, 0)),
        .package(path: "./Data"),
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(
                    name: "Data",
                    package: "Data"),
                .product(
                    name: "Dependency",
                    package: "Dependency")
            ])
    ]
)
