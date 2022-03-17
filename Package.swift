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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.14.0.xcframework.zip",
                      checksum: "19c2e3d957d3cd951ce69162a998dea318f8eaa17c407547eeed6c0e45bd4d3f"
                )
    ],
    swiftLanguageVersions: [.v5]
)
