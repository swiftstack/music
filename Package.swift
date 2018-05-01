// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Music",
    products: [
        .library(name: "Music", targets: ["Music"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-stack/platform.git",
            .branch("master")),
        .package(
            url: "https://github.com/swift-stack/test.git",
            .branch("master")),
    ],
    targets: [
        .target(
            name: "Music",
            dependencies: ["Platform"]),
        .testTarget(
            name: "MusicTests",
            dependencies: ["Test", "Music"]),
    ]
)
