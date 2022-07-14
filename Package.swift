// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InAppStorySDK_UGC_SwiftUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "InAppStorySDK_UGC_SwiftUI", targets: ["InAppStorySDK_UGC_SwiftUI"])
    ],
    targets: [
        .binaryTarget(name: "InAppStorySDK_UGC_SwiftUI",
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_UGC_SwiftUI-1.16.1.xcframework.zip",
                      checksum: "e774096b1f060b82bde6e2f30f3aeaca2b56ed15d1108dcccddc8616339e0a24"
                )
    ],
    swiftLanguageVersions: [.v5]
)
