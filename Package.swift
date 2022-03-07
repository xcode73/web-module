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
        .package(url: "https://github.com/feathercms/feather-core", .branch("dev")),
        .package(url: "https://github.com/feathercms/feather-api", .branch("main")),
        .package(url: "https://github.com/feathercms/web-api", .branch("main")),
    ],
    targets: [
        .target(name: "WebModule", dependencies: [
                .product(name: "FeatherApi", package: "feather-api"),
                .product(name: "WebApi", package: "web-api"),
                .product(name: "Feather", package: "feather-core"),
            ],
            resources: [
                .copy("Bundle"),
            ]),
    ]
)
