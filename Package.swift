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
                      url: "https://github.com/inappstory/ios-sdk/files/11635341/InAppStorySDK_SwiftUI-1.20.11.xcframework.zip",
                      checksum: "70bc031ee871b54d276e3fd173777adb8125419a991790212277e195ae893af9"
                )
    ],
    swiftLanguageVersions: [.v5]
)

