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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.2.xcframework.zip",
                      checksum: "736b798ccfa77b40b7437c332f1ca207ddcb69e9dfa5704807da8a0fa80f20e8"
                )
    ],
    swiftLanguageVersions: [.v5]
)
