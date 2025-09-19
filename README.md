# InAppStory

### Pre-release version of the library

A library for embedding stories into an application with customization.

| InAppStory version | Build version | iOS version |
|--------------------|---------------|-------------|
| 1.26.0-RC3         | 3817          | >= 11.0     |

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
pod 'InAppStory', :git => 'https://github.com/inappstory/ios-ias-sdk.git', :tag => '1.26.0-RC3'
```

### XCode SPM installation
Alternatively, you can add an InAppStory via XCode:

1. First click on the project;
2. Select "*Add Package Dependencies...*";
3. In the "*Enter Package URL*" field, specify the URL of this repository;
4. Select package ias-ios-spm;
5. Set "*Dependecy rule*" to "*Exact Version*" and set *"1.26.0-RC1"*;
6. Click the "*Add Package*" button and wait for the installation to take place.


## Changes

### 1.26.0-RC3

- added the ability to prevent InAppMessages from closing;.

### 1.26.0-RC2

- the id parameter has been changed to placeID during initialization.
- memory handling has been fixed.
- the options feature has been added.
- the anonymous feature has been added.

### 1.26.0-RC1

- Banner functionality has been added. Information on initialization, operation, and customization is available in the documentation, in the [Banner place](https://docs.inappstory.com/sdk-guides/ios/banners.html#events) section.