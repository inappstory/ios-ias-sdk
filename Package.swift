// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InAppStorySDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "InAppStorySDK", targets: ["InAppStorySDK"])
    ],
    targets: [
        .binaryTarget(name: "InAppStorySDK",
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.20.1.xcframework.zip",
                      checksum: "23db19fa03e7fccc4f1be89b9cb547eb10dabac3cd06e088d5a56d95ed6bc0a4"
                )
    ],
    swiftLanguageVersions: [.v5]
)
