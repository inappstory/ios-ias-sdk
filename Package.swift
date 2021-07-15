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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.6.2/InAppStorySDK-1.6.2.xcframework.zip",
                      checksum: "29c6ec7d5d0f814018059049b8159fcd195e7ff98219a4da455bb7ecd07bd22b"
                )
    ],
    swiftLanguageVersions: [.v5]
)
