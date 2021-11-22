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
                      url: "https://github.com/inappstory/ios-sdk/files/7582987/InAppStorySDK-1.11.0.xcframework.zip",
                      checksum: "f15e557a862fd485b5fe581c2e5a65f48c972d24efffd450fef2eab610dc0ba4"
                )
    ],
    swiftLanguageVersions: [.v5]
)
