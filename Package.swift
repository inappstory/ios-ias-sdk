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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.9.0/InAppStorySDK-1.9.0.xcframework.zip",
                      checksum: "c0485143161f5c693430a64fb8911486d4fcdea7d1d7da1b8276201d2adda85c"
                )
    ],
    swiftLanguageVersions: [.v5]
)
