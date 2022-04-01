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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.14.1.xcframework.zip",
                      checksum: "fdbcf9518fc470c23a65489806b3b80f4eed3d12482b603d943ec9862f73b020"
                )
    ],
    swiftLanguageVersions: [.v5]
)
