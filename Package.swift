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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.17.0.xcframework.zip",
                      checksum: "008f70f3eaa37caffc0e61b7ad09af2ed97d3882c4b1e7dad3685e1a41ba52c1"
                )
    ],
    swiftLanguageVersions: [.v5]
)
