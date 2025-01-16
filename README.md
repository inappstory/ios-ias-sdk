# InAppStory

### Pre-release version of the library

A library for embedding stories into an application with customization.

| InAppStory version | Build version | iOS version |
|--------------------|---------------|-------------|
| 1.25.0-RC4         | 3535          | >= 11.0     |

Version of the library can be obtained from the parameter `InAppStory.buildInfo`

All documentation with code samples has been moved to [docs.inappstory.com](https://docs.inappstory.com/sdk-guides/ios/how-to-get-started.html)

## Instalation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects.
Follow instructions on their website for seamless installation.
To integrate InAppStory into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
# UIKit
use_frameworks!
pod 'InAppStory', :git => 'https://github.com/inappstory/ios-ias-sdk.git', :tag => '1.25.0-RC4'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate InAppStory into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
# UIKit
github "inappstory/ios-ias-sdk" ~> 1.25.0-RC4
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but InAppStory does support its use on supported platforms.

Once you have your Swift package set up, adding InAppStory as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
//UIKit
dependencies: [
    .package(url: "https://github.com/inappstory/IAS-iOS-SPM.git", .exact("1.25.0-RC4"))
]
```

### XCode SPM installation
Alternatively, you can add an InAppStory via XCode:

1. First click on the project;
2. Select "*Add Package Dependencies...*";
3. In the "*Enter Package URL*" field, specify the URL of this repository;
4. Select package ias-ios-spm;
5. Set "*Dependecy rule*" to "*Exact Version*" and set *"1.25.0-RC4"*;
6. Click the "*Add Package*" button and wait for the installation to take place.


## Changes

### 1.25.0-RC4

- display *PopUp* and *BottomSheet* IAM on iPad;
- closing IAM by button from the message content;

### 1.25.0-RC3

- display storis and games from *PopUp* and *BottomSheet* in IAM;
- displaying a custom sharing window from storis and games on top of IAM;

### 1.25.0-RC2

- added rendering of *BottomSheet* and *PopUp* according to the ratio from the server;
- added restriction on showing stories on iPad;

### 1.25.0-RC1

- Added InAppMessages (IAM) functionality. For more detailed documentation, see [In-App-Messages](https://docs.inappstory.com/sdk-guides/ios/in-app-messaging.html)
  
#####To open IAM added method:
``` Swift
func showInAppMessageWith(id: <String>, onlyPreloaded: <Bool>, completion: ((_ show: Bool) -> Void)?)
```

#####To preload IAM added method:
``` Swift
func preloadInAppMessages(complete: @escaping (Result<Bool, Error>) -> Void)
```