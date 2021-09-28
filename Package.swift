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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.8.4/InAppStorySDK-1.8.4.xcframework.zip",
                      checksum: "5144e965c920c8876faf36f6d6396446069d6141c273ef29210a0beccc9de936"
                )
    ],
    swiftLanguageVersions: [.v5]
)
