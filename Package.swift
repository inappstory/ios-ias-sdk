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
                      url: "https://cs.getinappstory.com/iOS/InAppStorySDK-1.22.0.xcframework.zip",
                      checksum: "56de52dcc2df3dd60641109a5a5bd98fa985aa7d6f4558cc957d82be4c7a8319"
                )
    ],
    swiftLanguageVersions: [.v5]
)
