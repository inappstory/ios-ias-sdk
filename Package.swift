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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.15.7.xcframework.zip",
                      checksum: "70c313a2cc3498129f09c70ee89508249a67bae2a5cf134848ee7e1ad8c98925"
                )
    ],
    swiftLanguageVersions: [.v5]
)
