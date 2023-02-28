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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.7.xcframework.zip",
                      checksum: "c6861d2f19d9a112dd8ea7c0374cd9e108b2c67c24169d45658846cc86f9a5f0"
                )
    ],
    swiftLanguageVersions: [.v5]
)
