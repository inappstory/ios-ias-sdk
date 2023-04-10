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
                      url: "https://github.com/inappstory/ios-sdk/files/11191343/InAppStorySDK_SwiftUI-1.19.10.xcframework.zip",
                      checksum: "383a4d9b13e4afc029653e924f39b68d5e1d35cbf8c5340cf95a7df5360217eb"
                )
    ],
    swiftLanguageVersions: [.v5]
)

