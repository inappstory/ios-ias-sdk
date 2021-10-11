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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.9.0/InAppStorySDK-1.9.0.xcframework.zip",
                      checksum: "b2bac6f70ed7636f8942f66593108366a242cb885c2892d3c9481392db5e45b7"
                )
    ],
    swiftLanguageVersions: [.v5]
)
