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
                      url: "https://github.com/inappstory/ios-sdk/files/7649601/InAppStorySDK-1.11.3.xcframework.zip",
                      checksum: "8b7dd5bd9d8c7b3f32e75485a058e05c65c300f0c798ac8022b24b963acc0764"
                )
    ],
    swiftLanguageVersions: [.v5]
)
