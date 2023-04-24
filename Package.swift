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
                      url: "https://github.com/inappstory/ios-sdk/files/11311638/InAppStorySDK_SwiftUI-1.20.9.xcframework.zip",
                      checksum: "caabc9744511ee84b5d42279e0fa4e72cc7ef40fffb2fa1ace247d95b233d467"
                )
    ],
    swiftLanguageVersions: [.v5]
)

