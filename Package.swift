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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.18.0.xcframework.zip",
                      checksum: "923bbaf4b65c309b93fe1d43d0572ad0e323c454319442db2d59b4c7fc5e5129"
                )
    ],
    swiftLanguageVersions: [.v5]
)
