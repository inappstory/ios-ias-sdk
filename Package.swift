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
                      url: "https://github.com/inappstory/ios-sdk/files/7846268/InAppStorySDK_SwiftUI-1.11.4.xcframework.zip",
                      checksum: "afb3ec3621eadd6b7d126fcc982652fd462dbc40f98e0300528d7d2cf9f95ac7"
                )
    ],
    swiftLanguageVersions: [.v5]
)

