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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.8.5/InAppStorySDK-1.8.5.xcframework.zip",
                      checksum: "15a9481bb2fd0ab902539fa94eb0a68de85a4de532162e29d2c50eacf6a9aa2f"
                )
    ],
    swiftLanguageVersions: [.v5]
)
