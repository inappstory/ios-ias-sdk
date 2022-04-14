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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.15.1.xcframework.zip",
                      checksum: "c40d58cbd5559a58cd048efa7444bff931571d3b5954c2efc051e720882194cb"
                )
    ],
    swiftLanguageVersions: [.v5]
)
