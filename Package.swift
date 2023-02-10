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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.19.6.xcframework.zip",
                      checksum: "df14609178749b28bb68d9d0493fe0648450f48dd411bbab6f9b1f8292f2c762"
                )
    ],
    swiftLanguageVersions: [.v5]
)
