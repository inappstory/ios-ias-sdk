// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InAppStorySDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "InAppStorySDK_UGC", targets: ["InAppStorySDK_UGC"])
    ],
    targets: [
        .binaryTarget(name: "InAppStorySDK_UGC",
                      url: "https://cs.inappstory.com/iOS/InAppStorySDK_UGC-1.17.0.xcframework.zip",
                      checksum: "2036b6358379e41b5d39da9db44b58037b732c2beb8dbb520439b8383a7c384c"
                )
    ],
    swiftLanguageVersions: [.v5]
)
