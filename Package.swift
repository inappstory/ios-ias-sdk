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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.20.4.xcframework.zip",
                      checksum: "56948c0d764f0c4566c58d70f65402bad631e4388fba6b7bba91320e9378536b"
                )
    ],
    swiftLanguageVersions: [.v5]
)
