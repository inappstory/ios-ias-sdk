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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.4.xcframework.zip",
                      checksum: "9c61bb2ec878f9496f995585b5cfceaeaa1e7dd39c235cb50d4cca6e3ffe14de"
                )
    ],
    swiftLanguageVersions: [.v5]
)
