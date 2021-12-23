// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InAppStorySDK_SwiftUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "InAppStorySDK_SwiftUI", targets: ["InAppStorySDK_SwiftUI"])
    ],
    targets: [
        .binaryTarget(name: "InAppStorySDK_SwiftUI",
                      url: "https://github.com/inappstory/ios-sdk/files/7769590/InAppStorySDK_SwiftUI-1.12.0.xcframework.zip",
                      checksum: "c5a0aebf841eb6f2195e0bfb5bdb2a545768873bba5f92b2d4b378055593ab86"
                )
    ],
    swiftLanguageVersions: [.v5]
)

