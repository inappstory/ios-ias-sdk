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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.20.2.xcframework.zip",
                      checksum: "0177408c042962443af62d8633a69973c05343b400b2b6727289e56e534047e5"
                )
    ],
    swiftLanguageVersions: [.v5]
)
