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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.15.3.xcframework.zip",
                      checksum: "23c32d88726c94d58fc51ab50f0aa2c59b6cc664dafc46aadee3fac7388bcb43"
                )
    ],
    swiftLanguageVersions: [.v5]
)
