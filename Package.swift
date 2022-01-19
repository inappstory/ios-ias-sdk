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
                      url: "https://github.com/inappstory/ios-sdk/files/7897130/InAppStorySDK_SwiftUI-1.12.2.xcframework.zip",
                      checksum: "112b7c1b2e80035f3dc05049d93dd85f423034277ae5a21c71976aa0230c125e"
                )
    ],
    swiftLanguageVersions: [.v5]
)
