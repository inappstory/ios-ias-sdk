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
                      url: "https://github.com/inappstory/ios-sdk/files/11848819/InAppStorySDK-1.20.12.xcframework.zip",
                      checksum: "c894f4fd3acb01cd94b60ee7a3ee01308b6342477a1cba8551effcf296fc964c"
                )
    ],
    swiftLanguageVersions: [.v5]
)
