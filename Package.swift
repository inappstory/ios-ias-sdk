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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.6.1/InAppStorySDK-1.6.1.xcframework.zip",
                      checksum: "bacb0bda69cf5129d12c98aab5b41197c91d29ffb82ce8930e88f3969bf80d64"
                )
    ],
    swiftLanguageVersions: [.v5]
)
