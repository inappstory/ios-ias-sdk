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
                      url: "https://github.com/inappstory/ios-sdk/files/7586655/InAppStorySDK_SwiftUI-1.11.0.xcframework.zip",
                      checksum: "64a76368c36c20796dae4335654d4bd7861324ce626ccb8d9bd88eb7d3cdc901"
                )
    ],
    swiftLanguageVersions: [.v5]
)

