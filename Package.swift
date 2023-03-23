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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.20.7.xcframework.zip",
                      checksum: "a849bc3a737f381e54dfbd9f5f7e5f7f015535f5f465a59fa5725a567b205edc"
                )
    ],
    swiftLanguageVersions: [.v5]
)
