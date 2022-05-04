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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_SwiftUI-1.15.4.xcframework.zip",
                      checksum: "c03fd8020b2f5e338d07c2c11dc6948cd690d0b508a1ba7fe90b1bc15f654fbb"
                )
    ],
    swiftLanguageVersions: [.v5]
)
