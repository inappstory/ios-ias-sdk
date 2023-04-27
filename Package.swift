// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InAppStorySDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "InAppStorySDK", targets: ["InAppStorySDK"])
    ],
    targets: [
        .binaryTarget(name: "InAppStorySDK",
                      url: "https://github.com/inappstory/ios-sdk/files/11344396/InAppStorySDK-1.21.0.xcframework.zip",
                      checksum: "ac55574cf42f1c215f71988679391bb01c861e1e51d67646ac028bd5298eec69"
                )
    ],
    swiftLanguageVersions: [.v5]
)
