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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.16.1.xcframework.zip",
                      checksum: "834cc2196d65fa0533808bd06b3f68c7a3eaf04c1e5bda115c9045b3f52dc36b"
                )
    ],
    swiftLanguageVersions: [.v5]
)
