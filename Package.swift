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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.9.2/InAppStorySDK-1.9.2.xcframework.zip",
                      checksum: "ab9ff678f071e9a53b859354a8256fe9e556e9a74f188c22b8ee0a98eb8c70be"
                )
    ],
    swiftLanguageVersions: [.v5]
)
