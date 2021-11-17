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
                      url: "https://github.com/inappstory/ios-sdk/files/7555745/InAppStorySDK-1.9.3.xcframework.zip",
                      checksum: "cd0692dd98cb99b6f860503e26b2680348966a38c257dbb22b1841b792bbdced"
                )
    ],
    swiftLanguageVersions: [.v5]
)
