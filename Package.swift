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
                      url: "https://github.com/inappstory/ios-sdk/files/7624184/InAppStorySDK_SwiftUI-1.11.2.xcframework.zip",
                      checksum: "89489d26c8f3efb6f852a4591fe5cfce1ad0183b35ebc361e52e4b3a0054837d"
                )
    ],
    swiftLanguageVersions: [.v5]
)

