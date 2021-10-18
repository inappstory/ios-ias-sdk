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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.9.2/InAppStorySDK-1.9.2.xcframework.zip",
                      checksum: "1e364e232a65fa1f77c6b86dbd86430931e97c8e58b9e1bd01cc680096e918a3"
                )
    ],
    swiftLanguageVersions: [.v5]
)
