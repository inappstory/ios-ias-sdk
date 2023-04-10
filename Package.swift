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
                      url: "https://github.com/inappstory/ios-sdk/files/11191250/InAppStorySDK-1.19.10.xcframework.zip",
                      checksum: "f8a69c15f937860425977e1400abb906954c0ca071ed8e8832ad7cf9bf75d8da"
                )
    ],
    swiftLanguageVersions: [.v5]
)
