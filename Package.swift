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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.16.2.xcframework.zip",
                      checksum: "ed729d60f416957a4d5ca1615c0ee1a6966f2396070c457a799a0cac99ada1c6"
                )
    ],
    swiftLanguageVersions: [.v5]
)
