// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "transifex-macro",
    // Match the same OS versions supported by `String(localized: ...)`
    platforms: [.macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8)],
    products: [
        .library(
            name: "Localized",
            targets: ["Localized"]
        ),
        .executable(
            name: "LocalizedClient",
            targets: ["LocalizedClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git",
                 from: "601.0.0-latest"),
    ],
    targets: [
        .macro(
            name: "LocalizedMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros",
                         package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin",
                         package: "swift-syntax")
            ]
        ),

        .target(name: "Localized",
                dependencies: ["LocalizedMacros"]),

        .executableTarget(name: "LocalizedClient",
                          dependencies: ["Localized"]),

        .testTarget(
            name: "LocalizedTests",
            dependencies: [
                "LocalizedMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport",
                         package: "swift-syntax"),
            ]
        ),
    ]
)
