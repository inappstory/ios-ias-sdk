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
                      url: "https://github.com/inappstory/ios-sdk/files/7586685/InAppStorySDK-1.11.0.xcframework.zip",
                      checksum: "a5bd49759e89a18abb27bdf59efd6ba5bdc752d479fc906606bf7a220d07236a"
                )
    ],
    swiftLanguageVersions: [.v5]
)
