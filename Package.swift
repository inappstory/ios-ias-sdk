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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.18.6.xcframework.zip",
                      checksum: "1eb75986e184864b59c8710c7cfb56d2c304c11c6223f2185621be1ec9d5e239"
                )
    ],
    swiftLanguageVersions: [.v5]
)
