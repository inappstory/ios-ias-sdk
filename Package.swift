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
                      url: "https://github.com/inappstory/ios-sdk/files/7846046/InAppStorySDK-1.11.4.xcframework.zip",
                      checksum: "e637d80d6f1c74e09a8581ed3923b169c3b501b0fb564b0881e5fe84f8f61be1"
                )
    ],
    swiftLanguageVersions: [.v5]
)
