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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.18.1.xcframework.zip",
                      checksum: "27be8596c3410015e360c1320dd84d2f24e59c8c4e3783bfea78705d4cfb83a8"
                )
    ],
    swiftLanguageVersions: [.v5]
)
