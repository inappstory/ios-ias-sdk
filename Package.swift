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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_SwiftUI-1.19.5.xcframework.zip",
                      checksum: "8e6035f94d9490d10e0754f1055f5c75ebf75de840603b5401c6dfa3cacec698"
                )
    ],
    swiftLanguageVersions: [.v5]
)

