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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.10.0/InAppStorySDK-1.10.0.xcframework.zip",
                      checksum: "28af87e7deb6a275156930e0e1ffa5aabe7a86b66618ee4d1765dd49e5fca216"
                )
    ],
    swiftLanguageVersions: [.v5]
)
