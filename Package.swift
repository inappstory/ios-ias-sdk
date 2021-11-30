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
                      url: "https://github.com/inappstory/ios-sdk/files/7624129/InAppStorySDK-1.11.2.xcframework.zip",
                      checksum: "59d631ddbb9f22d1056742d10ca17744c2d1a963441887bc530acae29178fa7a"
                )
    ],
    swiftLanguageVersions: [.v5]
)
