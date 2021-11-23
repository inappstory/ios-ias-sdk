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
                      url: "https://github.com/inappstory/ios-sdk/files/7587870/InAppStorySDK-1.10.3.xcframework.zip",
                      checksum: "0733df69d7bbd41328f3fab8ef47da6b935309e9980cf119940c42cc36f3d049"
                )
    ],
    swiftLanguageVersions: [.v5]
)
