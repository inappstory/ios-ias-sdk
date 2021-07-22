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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.7.1/InAppStorySDK-1.7.1.xcframework.zip",
                      checksum: "25af539040ad15ab6bf4b4d22c9fe704d6e10183599dad69c953d7bf3b6162b5"
                )
    ],
    swiftLanguageVersions: [.v5]
)
