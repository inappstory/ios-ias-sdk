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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.6.0/InAppStorySDK-1.6.0.xcframework.zip",
                      checksum: "06bc3698d7d4cd03e363a4548e5a1edb93f44889e9b5a830446cab5935ff1d47"
                )
    ],
    swiftLanguageVersions: [.v5]
)
