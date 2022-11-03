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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.18.3.xcframework.zip",
                      checksum: "bacc7e483e13d4624f63255b2b639bd8abf0be9a2d64384983e00201d9fc4c47"
                )
    ],
    swiftLanguageVersions: [.v5]
)
