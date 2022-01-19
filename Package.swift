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
                      url: "https://github.com/inappstory/ios-sdk/files/7896268/InAppStorySDK-1.12.2.xcframework.zip",
                      checksum: "45d0847e8de6b8b5dc00deaa811f682f720a64f172952d93c921588ca7959add"
                )
    ],
    swiftLanguageVersions: [.v5]
)
