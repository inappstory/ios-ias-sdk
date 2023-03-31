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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.9.xcframework.zip",
                      checksum: "6fc6dcf232bd7ac75338c63d52909e22f0f640418310cf47b1de352908e066ea"
                )
    ],
    swiftLanguageVersions: [.v5]
)
