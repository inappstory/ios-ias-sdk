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
                      url: "https://github.com/inappstory/ios-sdk/files/11745564/InAppStorySDK-1.21.2.xcframework.zip",
                      checksum: "a23df7b957638a00e3adbe5b4491abf76e5343c1cc0523b9614ea02493a0f579"
                )
    ],
    swiftLanguageVersions: [.v5]
)
