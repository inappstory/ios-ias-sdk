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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.7.2/InAppStorySDK-1.7.2.xcframework.zip",
                      checksum: "79f08ebb1ff2983895602304744efe5b86491d5e7d0fe9e483152266fdfe7e7d"
                )
    ],
    swiftLanguageVersions: [.v5]
)
