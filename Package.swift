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
                      url: "https://github.com/inappstory/ios-sdk/files/7617627/InAppStorySDK-1.10.4.xcframework.zip",
                      checksum: "0d7e0500f5fc6a310bc6ca4944223b71b57cc9c6b39ee5ddf692e89e4193c94d"
                )
    ],
    swiftLanguageVersions: [.v5]
)
