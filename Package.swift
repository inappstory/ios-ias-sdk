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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.8.1/InAppStorySDK-1.8.1.xcframework.zip",
                      checksum: "f3a9c345fc3b0d8c3f8ec8b0ae0020d40b9bc1c5a5d63434df1c6747abadd937"
                )
    ],
    swiftLanguageVersions: [.v5]
)
