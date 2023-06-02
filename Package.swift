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
                      url: "https://github.com/inappstory/ios-sdk/files/11635342/InAppStorySDK-1.20.11.xcframework.zip",
                      checksum: "521a6941abc60469888c9d25b93b20f5700d63ba83471a05cbf2298d9b9e085c"
                )
    ],
    swiftLanguageVersions: [.v5]
)
