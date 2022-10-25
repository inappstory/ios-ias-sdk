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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.18.2.xcframework.zip",
                      checksum: "e19b360194e68697553f2896f0cdd9ffd73c65121421f588e17acb08f01574c6"
                )
    ],
    swiftLanguageVersions: [.v5]
)
