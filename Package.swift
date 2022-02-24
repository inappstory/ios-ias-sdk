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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.13.1.xcframework.zip",
                      checksum: "1e6ba4ca220ad87b2a77e3e27be848b210766003904e395cd86c7adfda4b936f"
                )
    ],
    swiftLanguageVersions: [.v5]
)
