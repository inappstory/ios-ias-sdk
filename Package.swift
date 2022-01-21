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
                      url: "https://github.com/inappstory/ios-sdk/files/7913206/InAppStorySDK_SwiftUI-1.12.3.xcframework.zip",
                      checksum: "88263a6d638e8b802254be7fa604775535adbbe22d9e698b90eb14c4220f9f8e"
                )
    ],
    swiftLanguageVersions: [.v5]
)
