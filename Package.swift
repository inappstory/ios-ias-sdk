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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.17.1.xcframework.zip",
                      checksum: "1a42e192d6e36a2ed8565f5b425db88b441ce47f25e0d795ba985b828787cb2d"
                )
    ],
    swiftLanguageVersions: [.v5]
)
