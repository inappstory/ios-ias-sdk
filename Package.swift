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
                      url: "https://github.com/inappstory/ios-sdk/files/11311642/InAppStorySDK-1.20.9.xcframework.zip",
                      checksum: "6a660a900cdf982e8e106c882095841d8268852f97a2f1842811d1ee67592bde"
                )
    ],
    swiftLanguageVersions: [.v5]
)
