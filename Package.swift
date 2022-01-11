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
                      url: "https://github.com/inappstory/ios-sdk/files/7846349/InAppStorySDK-1.12.1.xcframework.zip",
                      checksum: "612d7564b378babbf996c7b6966094bbfc6f62325cc63c976281d57bd75eab8d"
                )
    ],
    swiftLanguageVersions: [.v5]
)
