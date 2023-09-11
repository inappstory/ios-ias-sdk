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
        .binaryTarget(
            name: "InAppStorySDK_SwiftUI",
            path: "InAppStorySDK_SwiftUI.xcframework"
        )

    ],
    swiftLanguageVersions: [.v5]
)

