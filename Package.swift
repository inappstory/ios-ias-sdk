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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.15.4.xcframework.zip",
                      checksum: "83e9a2b7480315eeaee4fb47ca5295b759fd6197bb59141cfb5dd8a9e01bdbc4"
                )
    ],
    swiftLanguageVersions: [.v5]
)
