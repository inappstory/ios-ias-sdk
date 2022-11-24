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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.17.3.xcframework.zip",
                      checksum: "8b4e4fc9e9135b5466781d3a27b3d134886422fe2f3d178f6dfc5e6d5d88da6f"
                )
    ],
    swiftLanguageVersions: [.v5]
)

