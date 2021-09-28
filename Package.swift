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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.8.4/InAppStorySDK-1.8.4.xcframework.zip",
                      checksum: "6d2ff1c50c713d3bab3326ca9371595eee7757405ac1255f26c482b92faf3e13"
                )
    ],
    swiftLanguageVersions: [.v5]
)
