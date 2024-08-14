// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DependecyInjection",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DependecyInjection",
            targets: ["DependecyInjection"]),
    ],
    dependencies: [
        .package(path: "../CoreLayer"),
        .package(path: "../DomainLayer"),
        .package(path: "../DataLayer"),
        //THIS DI MODULES WAS DEVELOPED BY ME
        .package(url: "https://github.com/haroldjose30/AJDependencyInjection", exact: "0.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DependecyInjection",
            dependencies: ["CoreLayer","AJDependencyInjection","DomainLayer","DataLayer"]),
        .testTarget(
            name: "DependecyInjectionTests",
            dependencies: ["DependecyInjection","CoreLayer","AJDependencyInjection","DomainLayer","DataLayer"]),
    ]
)
