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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.15.6.xcframework.zip",
                      checksum: "3b0d3c2b8afbab2dbcdd1f1e006a174764e18b78d4500beaa66ed4c64d5e87a9"
                )
    ],
    swiftLanguageVersions: [.v5]
)
