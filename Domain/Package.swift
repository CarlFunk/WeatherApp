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
                "FavoriteDomain",
                "PermissionDomain",
                "SettingsDomain",
                "WeatherDomain"
            ])
    ],
    dependencies: [
        .package(url: "https://github.com/CarlFunk/Dependency", from: Version(0, 1, 0)),
        .package(path: "./Data"),
    ],
    targets: [
        .target(
            name: "FavoriteDomain",
            dependencies: [
                .product(
                    name: "Data",
                    package: "Data"),
                .product(
                    name: "Dependency",
                    package: "Dependency"),
                .target(
                    name: "WeatherDomain")
            ]),
        .target(
            name: "PermissionDomain",
            dependencies: [
                .product(
                    name: "Dependency",
                    package: "Dependency")
            ]),
        .target(
            name: "SettingsDomain",
            dependencies: [
                .product(
                    name: "Data",
                    package: "Data"),
                .product(
                    name: "Dependency",
                    package: "Dependency"),
                .target(
                    name: "WeatherDomain")
            ]),
        .target(
            name: "WeatherDomain",
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
