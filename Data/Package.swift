// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Data",
            targets: [
                "FavoriteData",
                "SettingsData",
                "WeatherData"
            ])
    ],
    dependencies: [
        .package(url: "https://github.com/CarlFunk/Dependency", from: Version(0, 1, 0))
    ],
    targets: [
        .target(
            name: "FavoriteData",
            dependencies: [
                .product(
                    name: "Dependency",
                    package: "Dependency")
            ]),
        .target(
            name: "SettingsData",
            dependencies: [
                .product(
                    name: "Dependency",
                    package: "Dependency")
            ]),
        .target(
            name: "WeatherData",
            dependencies: [
                .product(
                    name: "Dependency",
                    package: "Dependency")
            ])
    ]
)
