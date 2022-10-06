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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.15.8.xcframework.zip",
                      checksum: "daac8a1e47490fb601391023fb172d8534c506977c7ba23f1f7fc11235ea04ef"
                )
    ],
    swiftLanguageVersions: [.v5]
)
