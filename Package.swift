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
                      url: "https://cs.getinappstory.com/iOS/InAppStorySDK_SwiftUI-1.22.0.xcframework.zip",
                      checksum: "f66b796546ceda2d6d220a9bfcca1749c0e49cf61f9fd6072c77e8a310ec7674"
                )
    ],
    swiftLanguageVersions: [.v5]
)

