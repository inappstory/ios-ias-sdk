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
                      url: "https://github.com/inappstory/ios-sdk/files/11848821/InAppStorySDK_SwiftUI-1.20.12.xcframework.zip",
                      checksum: "2c2f5b584e75875a5caf6efd7f1018e12d60384b4188deec51cce66ed8e54caf"
                )
    ],
    swiftLanguageVersions: [.v5]
)

