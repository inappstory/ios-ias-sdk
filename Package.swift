// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InAppStorySDK_UGC_SwiftUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "InAppStorySDK_UGC_SwiftUI", targets: ["InAppStorySDK_UGC_SwiftUI"])
    ],
    targets: [
        .binaryTarget(name: "InAppStorySDK_UGC_SwiftUI",
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_UGC_SwiftUI-1.17.0.xcframework.zip",
                      checksum: "6682803b1f091dbf539edc2d8b31627d47ebfc29cd475e8751b1d9ebfa975ddb"
                )
    ],
    swiftLanguageVersions: [.v5]
)
