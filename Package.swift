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
                      url: "https://github.com/inappstory/ios-sdk/files/7649524/InAppStorySDK_SwiftUI-1.11.3.xcframework.zip",
                      checksum: "c1cd1db3eea998de9723badc53a3b93492eda80c551dd23d6e9e5b5ecefe348a"
                )
    ],
    swiftLanguageVersions: [.v5]
)

