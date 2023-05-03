// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InAppStorySDK_SwiftUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "InAppStorySDK_SwiftUI", targets: ["InAppStorySDK_SwiftUI"])
    ],
    targets: [
        .binaryTarget(name: "InAppStorySDK_SwiftUI",
                      url: "https://github.com/inappstory/ios-sdk/files/11383098/InAppStorySDK_SwiftUI-1.21.1.xcframework.zip",
                      checksum: "570075e5be000204cf4b177a5fc0d8810b8eb453c9bc488d30a2c08c46e9e6ec"
                )
    ],
    swiftLanguageVersions: [.v5]
)

