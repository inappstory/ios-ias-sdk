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
                      url: "https://github.com/inappstory/ios-sdk/files/8072011/InAppStorySDK-1.13.0.xcframework.zip",
                      checksum: "4a5da00deae09269516da19fe0139849095af0905ecf3c4f40c028683f321bae"
                )
    ],
    swiftLanguageVersions: [.v5]
)
