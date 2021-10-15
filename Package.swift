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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.8.6/InAppStorySDK-1.8.6.xcframework.zip",
                      checksum: "f3a9cb96eb65dfb2e76a401e13e073c1f0c7ce7b91d6ee3d3662be52eed579ca"
                )
    ],
    swiftLanguageVersions: [.v5]
)
