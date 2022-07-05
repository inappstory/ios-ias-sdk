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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.16.0.xcframework.zip",
                      checksum: "6787be8a98ff637ad5d31abd4b2a7a9033734a3275a5d3af6fb2997346a0ed8a"
                )
    ],
    swiftLanguageVersions: [.v5]
)
