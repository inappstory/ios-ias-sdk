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
                      url: "https://github.com/inappstory/ios-sdk/files/7555987/InAppStorySDK-1.10.2.xcframework.zip",
                      checksum: "ed9da17c41289b851e55288456da06a1d64b2f0871baee30d5fd6332b8a95566"
                )
    ],
    swiftLanguageVersions: [.v5]
)
