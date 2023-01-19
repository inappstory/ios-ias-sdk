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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.1.xcframework.zip",
                      checksum: "d6cc9ff423c57b2c376581dbaee1cbde1e217b733b263303e5f91447fb6afb0d"
                )
    ],
    swiftLanguageVersions: [.v5]
)
