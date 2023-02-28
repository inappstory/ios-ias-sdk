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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.18.7.xcframework.zip",
                      checksum: "984fc64f7b5050274c2e89fddb362f3bf8e50aa51493ea546383c4772c1e14b0"
                )
    ],
    swiftLanguageVersions: [.v5]
)
