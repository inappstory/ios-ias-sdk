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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.20.8.xcframework.zip",
                      checksum: "e2a11cf1235e9ce211db47c4f48c0f5eac87c8865ab2d181e89cbd69f898b68a"
                )
    ],
    swiftLanguageVersions: [.v5]
)
