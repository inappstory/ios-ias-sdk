# InAppStory

### Pre-release version of the library

A library for embedding stories into an application with customization.

| InAppStory version | Build version | iOS version |
|--------------------|---------------|-------------|
| 1.25.0-RC3         | 3533          | >= 11.0     |

Version of the library can be obtained from the parameter `InAppStory.buildInfo`

All documentation with code samples has been moved to [docs.inappstory.com](https://docs.inappstory.com/sdk-guides/ios/how-to-get-started.html)

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