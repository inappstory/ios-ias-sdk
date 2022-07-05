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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_UGC_SwiftUI-1.16.0.xcframework.zip",
                      checksum: "b6121fdf930cec493266ac396af20bdc34e9c4ce9261b9c1b9f72cb74863155d"
                )
    ],
    swiftLanguageVersions: [.v5]
)
