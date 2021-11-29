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
                      url: "https://github.com/inappstory/ios-sdk/files/7621245/InAppStorySDK-1.10.5.xcframework.zip",
                      checksum: "165c930247a6163b6616275ae813534fac3aa6c43512ef837eec531685d50703"
                )
    ],
    swiftLanguageVersions: [.v5]
)
