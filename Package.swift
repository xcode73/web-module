// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "web-module",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(name: "WebModule", targets: ["WebModule"]),
        .library(name: "WebRestKit", targets: ["WebRestKit"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/feathercms/feather-core", .branch("dev")),
        .package(path: "../feather-core"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.3.0"),
        .package(url: "https://github.com/binarybirds/swift-html", from: "1.6.0"),
    ],
    targets: [
        
        .executableTarget(name: "WebApp", dependencies: [
            .target(name: "WebModule"),
            
            .product(name: "Feather", package: "feather-core"),
            
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
        ]),
        .target(name: "WebModule",
                dependencies: [
                    .target(name: "WebRestKit"),
                    .product(name: "Feather", package: "feather-core"),
                    .product(name: "SwiftRss", package: "swift-html"),
                    .product(name: "SwiftSitemap", package: "swift-html"),
                ],
                resources: [
                    .copy("Bundle"),
                ]),
        .target(name: "WebRestKit", dependencies: [
            .product(name: "FeatherRestKit", package: "feather-core"),
        ]),
    ]
)
