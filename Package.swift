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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.8.3/InAppStorySDK-1.8.3.xcframework.zip",
                      checksum: "760cbeda2d76783976ba35afd988c12774ef430bf71e62c8bcd201033bad0957"
                )
    ],
    swiftLanguageVersions: [.v5]
)
