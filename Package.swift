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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_SwiftUI-1.13.2.xcframework.zip",
                      checksum: "c572c8f2e172817f2cee02b8ccf19fb92f465cf93622bed602bba2e9a5496277"
                )
    ],
    swiftLanguageVersions: [.v5]
)
