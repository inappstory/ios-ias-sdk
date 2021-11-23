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
                      url: "https://github.com/inappstory/ios-sdk/files/7586209/InAppStorySDK_SwiftUI-1.11.0.xcframework.zip",
                      checksum: "0299674084867fe7c1b18f12e7bf579473e6e754538f613029813b6978092bc5"
                )
    ],
    swiftLanguageVersions: [.v5]
)
