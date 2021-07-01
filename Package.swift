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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.5.6/InAppStorySDK-1.5.6.xcframework.zip",
                      checksum: "f4f719bc3f6a40f07937294f5604c76edb0b46e5c206af3d05902157da14c27d"
                )
    ],
    swiftLanguageVersions: [.v5]
)
