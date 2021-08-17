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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.7.4/InAppStorySDK-1.7.4.xcframework.zip",
                      checksum: "c7e0d209007b6ff70e0e71e5b573f4cdcf6d6dcdd8818e8b0b3299b0794325da"
                )
    ],
    swiftLanguageVersions: [.v5]
)
