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
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_SwiftUI-1.15.8.xcframework.zip",
                      checksum: "f90a9170a8bbc42aa0839d36beca0c2bd0b6aaa6b9dbf41e85ad720956f222f9"
                )
    ],
    swiftLanguageVersions: [.v5]
)
