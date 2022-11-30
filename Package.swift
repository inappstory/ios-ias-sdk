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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.17.4.xcframework.zip",
                      checksum: "9e395c9abc5f77b0dff54e7fcf395cc50f090aee67131dca3923249253143c9c"
                )
    ],
    swiftLanguageVersions: [.v5]
)

