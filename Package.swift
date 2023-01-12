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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.20.0.xcframework.zip",
                      checksum: "f9e5f07c5f01bfe140c64976de638e0ebe47463f1860f95c4e129e82f6b47765"
                )
    ],
    swiftLanguageVersions: [.v5]
)
