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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.17.2.xcframework.zip",
                      checksum: "f4f754ff2106ecd1822781a3ea23e9aded5bda2415b9dcb412356e36afd211a6"
                )
    ],
    swiftLanguageVersions: [.v5]
)
