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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.18.4.xcframework.zip",
                      checksum: "1279891790a2f030e99c46683414c25311108118ad3d6ed1b79c0a6d0c9d0c26"
                )
    ],
    swiftLanguageVersions: [.v5]
)
