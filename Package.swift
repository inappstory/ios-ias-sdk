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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.9.1/InAppStorySDK-1.9.1.xcframework.zip",
                      checksum: "66c9cd1faa0fb6c707f5c72b4b618152fe4e44b0c3e269b7b51ef60f6810d332"
                )
    ],
    swiftLanguageVersions: [.v5]
)
