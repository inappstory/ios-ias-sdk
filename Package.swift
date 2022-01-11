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
                      url: "https://github.com/inappstory/ios-sdk/files/7846388/InAppStorySDK_SwiftUI-1.12.1.xcframework.zip",
                      checksum: "5180b781aaad49b6cd60743419bc24b28d46f46eadb187944e268cc28020a9cb"
                )
    ],
    swiftLanguageVersions: [.v5]
)

