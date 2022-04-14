# PanelSettings

* [Overview](https://github.com/inappstory/ios-sdk/blob/main/Samples/PanelSettings.md#overview)
* [Like](https://github.com/inappstory/ios-sdk/blob/main/Samples/PanelSettings.md#like)
* [Favorites](https://github.com/inappstory/ios-sdk/blob/main/Samples/PanelSettings.md#favorites)
* [Share](https://github.com/inappstory/ios-sdk/blob/main/Samples/PanelSettings.md#share)

## Overview

In SDK version 1.15.1, a `PanelSettings` object has been added to work with displaying the bottom panel in a story with actions (like, favorites, share)

> The old variant with `likePanel`, `favoritePanel` and `sharePanel` of `InAppStory.shared` is currently available but will be removed soon.

To display the bottom panel with actions in stories, you must specify `InAppStory.shared.panelSettings` with the necessary display settings.

```swift
InAppStory.shared.panelSettings = PanelSettings(like: true, // enable like functional
                                                favorite: true, // enable favorites functional
                                                share: true) // enable share functional
```

Also, this parameter can be overridden for a specific feed, onboarding, or single story.

#### StoryView

After the `StoryView` is initialized and before the `create()` method is called, `panelSettings` can be specified which will only apply to that `StoryView` instance.

```swift
...
let storyView = StoryView() // init StoryView
storyView.panelSettings = PanelSettings(like: true, favorites: true, share: true) // set panel settings
storyView.target = self
addSubview(storyView)

storyView.create() // start storyView internal logic 
```

> These settings only affect the `StoryView` instance to which they are assigned. Others will be set to *default* values or taken from `InAppStory.shared.panelSettings` (if set)

#### Onboardings

To set special settings for the bottom bar in onboardings. You must specify the `panelSettings` parameter when calling the `showOnboardings(...)` method.

```swift
InAppStory.shared.showOnboardings(from: self, // target from where the reader will be shown
                                  delegate: self, // onboarding delegate
                                  with: PanelSettings(like: true, favorites: true, share: true)) // custom panel settings
{ show in
    // closure after showng reader
}
```

#### Single Story

To set special settings for the bottom bar in single story. You must specify the `panelSettings` parameter when calling the `showOnboardings(...)` method.

```swift
InAppStory.shared.showSingle(with: "<storyID>",
                             from: self, // target from where the reader will be shown
                             delegate: self, // single story delegate
                             with: PanelSettings(like: true, favorites: true, share: true)) // custom panel settings
{ _ in
    // closure after showng reader
}
```

## Like

The **"Like"** functionality allows you to track user reactions to stories. Likes are tied to a specific user ID, for which you need to specify it when initializing the library.  
To display *Like/Dislike* buttons in the bottom panel of stories, you must specify the `like` parameter when initializing `PanelSettings`.

```swift
PanelSettings(like: true)
```

#### Customize

*Like/Dislike* button icons can be redefined and set to your own, more suitable for the design of the application. For each button, you need to set icons for each state - *selected/unselected*. Icons can be of any format (recommended to use *.svg*). Size: *24ptx24pt*.

Icons are set via `InAppStory.shared`:

```swift
InAppStory.shared.likeImage = UIImage(named: "like")!
InAppStory.shared.likeSelectedImage = UIImage(named: "like_selected")!
InAppStory.shared.dislikeImage = UIImage(named: "dislike")!
InAppStory.shared.dislikeSelectedImage = UIImage(named: "dislike_selected")!
```

>it is advisable to set the icons and settings for the appearance of the reader before initializing the lists or displaying onboardings and single stories

## Favorites

The **"Favorites"** functionality allows users to save stories to a separate list and go to it at any time. Favorites are tied to a specific user ID, for which you need to specify it when initializing the library.  
To display *Favorites* buttons in the bottom panel of stories, you must specify the `favorites` parameter when initializing `PanelSettings`.

```swift
PanelSettings(favorites: true)
```

When the **"Favorites"** functionality is enabled, the list has an additional cell in it to display favorite stories. (*if at least one story is added to favorites*)  
To display the complete list of favorites, you need to create a new `StoryView` with the `favorite` parameter set to *true*. This is shown in more detail in the [document](https://github.com/inappstory/ios-sdk/blob/main/Samples/Favorites.md).

#### Customize

*Favorites* button icon can be redefined and set to your own, more suitable for the design of the application. For button, you need to set icons for each state - *selected/unselected*. Icons can be of any format (recommended to use *.svg*). Size: *24ptx24pt*.

Icons are set via `InAppStory.shared`:

```swift
InAppStory.shared.favoriteImage = UIImage(named: "favorites")!
InAppStory.shared.favoriteSelectedImag = UIImage(named: "favorites_selected")!
```

>it is advisable to set the icons and settings for the appearance of the reader before initializing the lists or displaying onboardings and single stories

To customize the favorite cell, you need to configure its display through delegate methods, or redefine the entire cell. More details about cell customization are written in the [document](https://github.com/inappstory/ios-sdk/blob/main/Samples/CustomCell.md#customization-via-storycellprotocol-and-favoritecellprotocol).

## Share

The **"Share"** functionality allows you to share links to a specific story or an image of this story (it is separately enabled in the console).  
To display *Share* button in the bottom panel of stories, you must specify the `share` parameter when initializing `PanelSettings`.

```swift
PanelSettings(share: true)
```

#### Customize

*Share* button icon can be redefined and set to your own, more suitable for the design of the application. For button, you need to set icons for each state - *selected/unselected*. Icons can be of any format (recommended to use *.svg*). Size: *24ptx24pt*.

Icons are set via `InAppStory.shared`:

```swift
InAppStory.shared.shareImage = UIImage(named: "share")!
InAppStory.shared.shareSelectedImage = UIImage(named: "share_selected")!
```

>it is advisable to set the icons and settings for the appearance of the reader before initializing the lists or displaying onboardings and single stories