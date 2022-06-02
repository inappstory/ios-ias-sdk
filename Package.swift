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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.15.5.xcframework.zip",
                      checksum: "d3ce831b170d6a630b1515f913b4dca50ad4db9f430076f95049c27737f8e379"
                )
    ],
    swiftLanguageVersions: [.v5]
)
