// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InAppStorySDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "InAppStorySDK_UGC", targets: ["InAppStorySDK_UGC"])
    ],
    targets: [
        .binaryTarget(name: "InAppStorySDK_UGC",
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_UGC-1.16.0.xcframework.zip",
                      checksum: "b61a299876c548e5128be17d8902c2c44ed20f6e744afdf177f0ec7a8709deae"
                )
    ],
    swiftLanguageVersions: [.v5]
)
