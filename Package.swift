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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.8.0/InAppStorySDK-1.8.0.xcframework.zip",
                      checksum: "8e171c78fd1bf1ba152eebcbbc6d661ad909569d88abac8b4faf098e0da8ce89"
                )
    ],
    swiftLanguageVersions: [.v5]
)
