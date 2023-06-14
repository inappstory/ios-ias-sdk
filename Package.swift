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
                      url: "https://github.com/inappstory/ios-sdk/files/11745567/InAppStorySDK_SwiftUI-1.21.2.xcframework.zip",
                      checksum: "9e5e329aaa240bfe8b8cfc4321d8144a106568e6959262c8d8a413696a5303c5"
                )
    ],
    swiftLanguageVersions: [.v5]
)

