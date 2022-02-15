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
                      url: "https://github.com/inappstory/ios-sdk/files/8069177/InAppStorySDK_SwiftUI-1.13.0.xcframework.zip",
                      checksum: "38f934a5c520eae8186a0df9d24f1fcea0c5aab9ee32b51afe753305a255aab7"
                )
    ],
    swiftLanguageVersions: [.v5]
)
