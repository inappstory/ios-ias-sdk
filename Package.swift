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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.10.1/InAppStorySDK-1.10.1.xcframework.zip",
                      checksum: "a9a35d56878b0843fd6fde0ccf89edd60c874836f2e765422fa4585f65871aae"
                )
    ],
    swiftLanguageVersions: [.v5]
)
