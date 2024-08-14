// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataLayer",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DataLayer",
            targets: ["DataLayer"]),
    ],
    dependencies: [
        .package(path: "../CoreLayer"),
        //THIS DI MODULES WAS DEVELOPED BY ME
        .package(url: "https://github.com/haroldjose30/AJHttpClient", exact: "0.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DataLayer",
            dependencies: ["CoreLayer", "AJHttpClient"]),
        .testTarget(
            name: "DataLayerTests",
            dependencies: ["DataLayer","CoreLayer", "AJHttpClient"]),
    ]
)
