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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.15.0.xcframework.zip",
                      checksum: "5b6822b51f7ff5917f7a65d7b1983ada65906ca8b772162cf3086326b4b824c0"
                )
    ],
    swiftLanguageVersions: [.v5]
)
