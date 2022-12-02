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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.1.xcframework.zip",
                      checksum: "8b7c8838a50f6e46d5aee3f7e7f917e1c33acc941a7a535fc3a34b99b01fb3e2"
                )
    ],
    swiftLanguageVersions: [.v5]
)
