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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK-1.20.6.xcframework.zip",
                      checksum: "c350f4685a1ce972907fcbf94be0ff65009e23f797d42aa6ffa9d9b3183268f4"
                )
    ],
    swiftLanguageVersions: [.v5]
)
