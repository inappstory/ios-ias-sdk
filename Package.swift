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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.7.0/InAppStorySDK-1.7.0.xcframework.zip",
                      checksum: "a7ad41f327e9c415246dc99fd7833dbf422c81f860aab112cd4f8db792093708"
                )
    ],
    swiftLanguageVersions: [.v5]
)
