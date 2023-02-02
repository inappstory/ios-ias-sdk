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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.5.xcframework.zip",
                      checksum: "00dd03475ed0d2a50183883c2e22e3938da517a735830597580829cac83298dd"
                )
    ],
    swiftLanguageVersions: [.v5]
)
