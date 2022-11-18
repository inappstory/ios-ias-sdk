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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.0.xcframework.zip",
                      checksum: "4ea6d7d12e818b181a9c07804439385b35c511e7abfa5ba55114521bb01b0b26"
                )
    ],
    swiftLanguageVersions: [.v5]
)
