// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "web-module",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(name: "WebModule", targets: ["WebModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/xcode73/feather-core", .branch("test-dev")),
        .package(url: "https://github.com/xcode73/web-objects", .branch("test-dev")),
    ],
    targets: [
        .target(name: "WebModule", dependencies: [
                .product(name: "Feather", package: "feather-core"),
                .product(name: "WebObjects", package: "web-objects"),
            ],
            resources: [
                .copy("Bundle"),
            ]),
    ]
)
