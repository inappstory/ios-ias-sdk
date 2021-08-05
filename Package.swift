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
                      url: "https://github.com/inappstory/ios-sdk/releases/download/1.7.3/InAppStorySDK-1.7.3.xcframework.zip",
                      checksum: "b073d53eac007e5f8a23fea58939652b867b0c84612d15170c4aae89725bf44c"
                )
    ],
    swiftLanguageVersions: [.v5]
)
