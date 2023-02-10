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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.20.3.xcframework.zip",
                      checksum: "4f10c4c662b173b8b0a4a0a185edc82bab9d6a26cfdc71d7a02333e463b19297"
                )
    ],
    swiftLanguageVersions: [.v5]
)
