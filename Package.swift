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
                      url: "https://github.com/inappstory/ios-sdk/files/7649427/InAppStorySDK-1.10.6.xcframework.zip",
                      checksum: "1b916fe520abec74a3f5f2c3d29c7b647650f9b0a9235bdf3dcc884d51e2dfaf"
                )
    ],
    swiftLanguageVersions: [.v5]
)
