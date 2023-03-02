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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.8.xcframework.zip",
                      checksum: "1c6521d6786643ef9b31c62de0e710d3db92a2278076885f5195463e37edec42"
                )
    ],
    swiftLanguageVersions: [.v5]
)
