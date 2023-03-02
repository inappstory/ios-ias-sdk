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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.20.5.xcframework.zip",
                      checksum: "84604da26bcd7ef74249d6de13d0b961d1a52baa0b307cba781869d54e85577e"
                )
    ],
    swiftLanguageVersions: [.v5]
)
