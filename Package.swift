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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.18.8.xcframework.zip",
                      checksum: "099a2eb9d27d7ac731d3920787059262d35eee138bae1c3e5d2fc0a178de183b"
                )
    ],
    swiftLanguageVersions: [.v5]
)
