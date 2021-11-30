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
                      url: "https://github.com/inappstory/ios-sdk/files/7623891/InAppStorySDK-1.11.2.xcframework.zip",
                      checksum: "b8f7842480c26cdc675830942427804d98c591b8bea8666b852dc07a1a791183"
                )
    ],
    swiftLanguageVersions: [.v5]
)
