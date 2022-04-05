# Migration to Multi-feed (SDK v1.15.0)

In SDK version 1.15.0, the ability to use multitape has been added.

## StoryView

This functionality can be:  
1. To separate story feeds for different screens;  
2. Use of several lines on one screen;  
3. Providing different users with different feeds;  
4. Etc.

To work with multi-feed, the `feedID: <String>` parameter has been added to the **StoryView**. By default, this parameter is equal to an empty *String* and with this value it receives a default story feed from the server. If you don't plan to switch to multifeed at this time, don't specify a `feedID: <String>` when initializing the **StoryView**. In this case, everything will work as before.

```swift
StoryView(frame: <CGRect> = .zero, feedID: <String> = "", favorite: <Bool> = false)
```
More info see in [Mulifeed samples](https://github.com/inappstory/ios-sdk/blob/main/Samples/Mulifeed.md)


## Onboardings

The multifeed functionality can also be used in onboardings to separate them by screens or events.
To use multifeed in onboardings, you must specify `feedID: <String>` when calling the `showOnboardings` method. If you don't plan to switch to multifeed at this time, don't specify a `feedID: <String>`. In this case, everything will work as before.

```swift
InAppStory.shared.showOnboardings(feedID: <String> = "", from: <UIViewController>, with: <[String]?> = nil, delegate: <InAppStoryDelegate>, complete: <(_ show: Bool) -> Void>)
```
More info see in [Onboardings samples](https://github.com/inappstory/ios-sdk/blob/main/Samples/OnboardingStory.md)

> **Pay attention**  
> Displaying any feed in onboarding works according to onboarding rules. Stories are shown only once per user. The next time you try to show the read story in onboarding, it will be cut off.

## InAppStoryDelegate

### StoriesType

For enum `StoriesType` elements add parametr `feed`

```swift
enum StoriesType {
    case list(feed: String?)
    case single
    case onboarding(feed: String)
}
```

* For a regular list of stories - the default value is **"default"**
* For the list of onboardings - the default value is **"onboarding"**

> For `list`, the `feed` parameter can be set to **nil**, in case the delegate method was called from a favorites list.

## NotificationCenter

For all life cycle notifications, the `feed` parameter has been added - indicating from which feed the notification was called.