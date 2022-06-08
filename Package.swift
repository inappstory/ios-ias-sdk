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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_SwiftUI-1.15.6.xcframework.zip",
                      checksum: "8d880cce96e85274d77e9d22907c700f91b16871e9041354db725aacfcf75d32"
                )
    ],
    swiftLanguageVersions: [.v5]
)
