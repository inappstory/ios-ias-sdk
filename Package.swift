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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.13.2.xcframework.zip",
                      checksum: "87a9c8fe63baebe8aa5b88d2f5f1b6ee59bd513705eaddb514d5fe958c6177e4"
                )
    ],
    swiftLanguageVersions: [.v5]
)
