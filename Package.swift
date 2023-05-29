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
                      url: "https://github.com/inappstory/ios-sdk/files/11591062/InAppStorySDK-1.20.10.xcframework.zip",
                      checksum: "0a088955469d339374bfdb593aa64197b4e221476fe0d48e8b0b95dd685993e1"
                )
    ],
    swiftLanguageVersions: [.v5]
)
