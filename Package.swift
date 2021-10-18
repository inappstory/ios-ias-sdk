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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.8.6/InAppStorySDK-1.8.6.xcframework.zip",
                      checksum: "74c3bf8b7261eed2dee3cf79dd91923f9a611b51ebd0542d1481a6c8497bbc15"
                )
    ],
    swiftLanguageVersions: [.v5]
)
