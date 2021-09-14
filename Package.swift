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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.8.2/InAppStorySDK-1.8.2.xcframework.zip",
                      checksum: "2077caa259353ceed8117110a58d9a5a11b9c4b488167c2519e47f0f92136144"
                )
    ],
    swiftLanguageVersions: [.v5]
)
