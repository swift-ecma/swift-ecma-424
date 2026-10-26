// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "testing",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    dependencies: [
        .package(path: ".."),
        .package(url: "https://github.com/swift-compositions/swift-json.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-8259.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-4122.git", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-3339.git", branch: "main"),
        .package(url: "https://github.com/swift-ecma/swift-ecma-427.git", branch: "main"),
        .package(url: "https://github.com/swift-iso/swift-iso-5962.git", branch: "main"),
    ],
    targets: [
        .testTarget(
            name: "ECMA 424 JSON Tests",
            dependencies: [
                .product(name: "ECMA 424", package: "swift-ecma-424"),
                .product(name: "JSON", package: "swift-json"),
                .product(name: "RFC 8259", package: "swift-rfc-8259"),
                .product(name: "RFC 4122", package: "swift-rfc-4122"),
                .product(name: "RFC 3339", package: "swift-rfc-3339"),
                .product(name: "ECMA 427", package: "swift-ecma-427"),
                .product(name: "ISO 5962 License Expression", package: "swift-iso-5962"),
            ],
            path: "ECMA 424 JSON Tests"
        )
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .strictMemorySafety(),
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
            .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
            .enableUpcomingFeature("InferIsolatedConformances"),
            .enableExperimentalFeature("Lifetimes"),
            .treatAllWarnings(as: .error),
        ]
}
