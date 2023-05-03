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
                      url: "https://github.com/inappstory/ios-sdk/files/11383096/InAppStorySDK-1.21.1.xcframework.zip",
                      checksum: "cb6095972558e838faae8cc79271f6e71ab7ef8b2c1d7a63ba17b43dd8f4fd78"
                )
    ],
    swiftLanguageVersions: [.v5]
)
