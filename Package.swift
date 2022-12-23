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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.3.xcframework.zip",
                      checksum: "883b089deb925a3897ec96e1273b4d49296e6a094e0ce1c2fc2bcde319d9987c"
                )
    ],
    swiftLanguageVersions: [.v5]
)
