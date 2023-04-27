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
                      url: "https://github.com/inappstory/ios-sdk/files/11345271/InAppStorySDK_SwiftUI-1.21.0.xcframework.zip",
                      checksum: "f7f6ed9e737ba8f283e072bc40d7152d6d07b323c16afbad45913b1022443f75"
                )
    ],
    swiftLanguageVersions: [.v5]
)

