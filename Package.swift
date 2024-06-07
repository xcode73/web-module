// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "web-module",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "WebModule", targets: ["WebModule"])
    ],
    dependencies: [
        //local
        .package(path: "../feather-core"),
        .package(path: "../web-objects"),
//        .package(url: "https://github.com/xcode73/feather-core.git", branch: "test-dev"),
//        .package(url: "https://github.com/xcode73/web-objects.git", branch: "test-dev")
    ],
    targets: [
        .target(name: "WebModule", dependencies: [
                .product(name: "Feather", package: "feather-core"),
                .product(name: "WebObjects", package: "web-objects")
            ],
            resources: [
                .copy("Bundle")
            ]),
    ],
    swiftLanguageVersions: [.v5]
)
