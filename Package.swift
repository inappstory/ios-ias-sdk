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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.15.2.xcframework.zip",
                      checksum: "ce1e7bea5169bc96b8f0484f6409091e62b423f7df36ece0e0398e0d6f3151ec"
                )
    ],
    swiftLanguageVersions: [.v5]
)
