// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "CatbirdBrand",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .tvOS(.v17),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "CatbirdBrand", targets: ["CatbirdBrand"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/pkl-swift", .upToNextMinor(from: "0.10.0")),
    ],
    targets: [
        .target(
            name: "CatbirdBrand",
            dependencies: [
                .product(name: "PklSwift", package: "pkl-swift"),
            ],
            path: "Sources/CatbirdBrand",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "CatbirdBrandTests",
            dependencies: ["CatbirdBrand"],
            path: "Tests/CatbirdBrandTests"
        ),
    ]
)
