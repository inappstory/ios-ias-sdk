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
                      url: "https://github.com/inappstory/ios-sdk/files/7769701/InAppStorySDK-1.12.0.xcframework.zip",
                      checksum: "e6f13ee96b98d575d196b22b4759580f74f9cfe3bbf3ca797c027431fe4aa4ed"
                )
    ],
    swiftLanguageVersions: [.v5]
)
