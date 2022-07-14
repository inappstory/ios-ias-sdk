// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InAppStorySDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "InAppStorySDK_UGC", targets: ["InAppStorySDK_UGC"])
    ],
    targets: [
        .binaryTarget(name: "InAppStorySDK_UGC",
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_UGC-1.16.1.xcframework.zip",
                      checksum: "14e412904a08e6332a739618d419992d22939698f4f693d4bfc2f03563aef41e"
                )
    ],
    swiftLanguageVersions: [.v5]
)
