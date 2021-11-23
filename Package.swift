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
                      url: "https://github.com/inappstory/ios-sdk/files/7588038/InAppStorySDK_SwiftUI-1.11.1.xcframework.zip",
                      checksum: "23fb56cf617dfe12122ca5f70a4b242438ebe79d8967ad0ffc9da47d1ee0abbe"
                )
    ],
    swiftLanguageVersions: [.v5]
)

