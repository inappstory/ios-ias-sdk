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
                      url: "https://github.com/inappstory/ios-sdk/files/11591064/InAppStorySDK_SwiftUI-1.20.10.xcframework.zip",
                      checksum: "54dc974f82d09d30862754a251ff811294992b1d76d6717deaf1280d03d2e0b3"
                )
    ],
    swiftLanguageVersions: [.v5]
)

