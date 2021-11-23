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
                      url: "https://github.com/inappstory/ios-sdk/files/7588091/InAppStorySDK-1.11.1.xcframework.zip",
                      checksum: "1760e69f2f659dee26869b93c7d417794ef17aa3922a522aabca53f0d1f9d4bb"
                )
    ],
    swiftLanguageVersions: [.v5]
)
