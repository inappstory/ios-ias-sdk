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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.17.5.xcframework.zip",
                      checksum: "cc9b396dc3a5ce1e44ab839146bbd28657d8739c30d07502c9582019ac67a3da"
                )
    ],
    swiftLanguageVersions: [.v5]
)
