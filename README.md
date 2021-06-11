# InAppStory

A library for embedding stories into an application with customization.

## Contents

* [Installation](https://github.com/inappstory/ios-sdk#Installation)
	* [Manual installation](https://github.com/inappstory/ios-sdk#Manual-installation)
	* [CocoaPods](https://github.com/inappstory/ios-sdk#CocoaPods)
	* [Podfile](https://github.com/inappstory/ios-sdk#Podfile)
	* [Library import](https://github.com/inappstory/ios-sdk#Library-import)
* [InAppStory](https://github.com/inappstory/ios-sdk#InAppStory)
	* [Initialization](https://github.com/inappstory/ios-sdk#Initialization)
	* [Methods](https://github.com/inappstory/ios-sdk#Methods)
	* [Parameters and properties](https://github.com/inappstory/ios-sdk#Parameters-and-properties)
	* [Customization](https://github.com/inappstory/ios-sdk#Customization)
* [StoryView](https://github.com/inappstory/ios-sdk#StoryView)
	* [Initialization](https://github.com/inappstory/ios-sdk#Initialization)
	* [Methods](https://github.com/inappstory/ios-sdk#Methods)
	* [Parameters and properties](https://github.com/inappstory/ios-sdk#Parameters-and-properties)
* [OnboardingStory](https://github.com/inappstory/ios-sdk#OnboardingStory)
	* [Presentation](https://github.com/inappstory/ios-sdk#Presentation)
* [SingleStory](https://github.com/inappstory/ios-sdk#SingleStory)
	* [Presentation](https://github.com/inappstory/ios-sdk#Presentation)
* [Protocols](https://github.com/inappstory/ios-sdk#Protocols)
	* [StoryViewDeleagate](https://github.com/inappstory/ios-sdk#StoryViewDeleagate)
	* [StoryViewDeleagateFlowLayout](https://github.com/inappstory/ios-sdk#StoryViewDeleagateFlowLayout)
	* [OnboardingDelegate](https://github.com/inappstory/ios-sdk#OnboardingDelegate)
	* [SingleStoryDelegate](https://github.com/inappstory/ios-sdk#SingleStoryDelegate)
	* [PlaceholderProtocol](https://github.com/inappstory/ios-sdk#PlaceholderProtocol)
	* [GamePlaceholderProtocol](https://github.com/inappstory/ios-sdk#GamePlaceholderProtocol)
	* [StoryCellProtocol](https://github.com/inappstory/ios-sdk#StoryCellProtocol)
	* [FavoriteCellProtocol](https://github.com/inappstory/ios-sdk#FavoriteCellProtocol)
* [enum](https://github.com/inappstory/ios-sdk#enum)
	* [ScrollStyle](https://github.com/inappstory/ios-sdk#ScrollStyle)
	* [PresentationStyle](https://github.com/inappstory/ios-sdk#PresentationStyle)
	* [ClosePosition](https://github.com/inappstory/ios-sdk#ClosePosition)
	* [ActionType](https://github.com/inappstory/ios-sdk#ActionType)
* [Objects](https://github.com/inappstory/ios-sdk#Objects)
	* [Settings](https://github.com/inappstory/ios-sdk#Settings)
	* [WidgetStory](https://github.com/inappstory/ios-sdk#WidgetStory)
* [NotificationCenter](https://github.com/inappstory/ios-sdk#NotificationCenter)
	* [Events](https://github.com/inappstory/ios-sdk#Events)
	* [Errors](https://github.com/inappstory/ios-sdk#Errors)
* [Samples](Samples/Samples.md)

## Installation

| InAppStory version | Build version | iOS version |
|--------------------|---------------|-------------|
| 1.5.4              | 1362          | >= 10.0     |

Version of the library can be obtained from the parameter `InAppStory.buildInfo`

### Manual installation

Download `InAppStorySDK.xcframework` from the repository. Connect in the project settings on the *General* tab.

### CocoaPods

CocoaPods is a dependency manager for Objective-C/Swift, which automates and simplifies the process of using 3rd-party libraries in your projects. To install with cocoaPods, follow the "Get Started" section on [CocoaPods](https://cocoapods.org/).

#### Podfile

```ruby
use_frameworks!
pod 'InAppStory', :git => 'https://github.com/inappstory/ios-sdk.git'
```

#### Library import

##### Objective-C

```objective-c
#import <InAppStorySDK/InAppStorySDK.h>
```

##### Swift

```swift
import InAppStorySDK
```

## InAppStory

The main singleton class for managing data and customizing the display of lists and the reader.

### Initialization

Library Initialization is preferably carried out in `AppDelegate`: 

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool 
{
	InAppStory.shared.initWith(serviceKey: <String>, testKey: <String>, settings: <Settings?>)
	return true
}
```

* `serviceKey` - service authorization key (\<*String*>); 
* `testKey ` - test authorization key in the service (\<*String*>);  
* `settings` - configuration object (*<[Settings?](https://github.com/inappstory/ios-sdk#Settings)>* - *optional*).

>**Attention!**  
>If you pass *testKey*, then the library will display the stories only in the **"Moderation"** status.

### Methods
* `addTags(<Array<String>>)` - adding tags;
* `removeTags(<Array<String>>)` - remove tags;
* `getWidgetStories(complete: (Array<WidgetStory>?) -> Void)` - getting a list of stories for a widget;
* `onboardingPresent(controller presentingViewController: <UIViewController>, with transitionStyle: <UIModalTransitionStyle>)` - serves for display of a custom controller over onboarding stories;
* `singleStoryPresent(controller presentingViewController: <UIViewController>, with transitionStyle: <UIModalTransitionStyle>)` - serves for display of a custom controller over a single story;

### Parameters and properties
* `onboardingDelegate` - should implement the protocol *<[OnboardingDelegate](https://github.com/inappstory/ios-sdk#OnboardingDelegate)>*;
* `singleStoryDelegate` - should implement the protocol *<[SingleStoryDelegate](https://github.com/inappstory/ios-sdk#SingleStoryDelegate)>*;
* `favoritesCount` - the number of favorite stories a user has
* `isLoggingEnabled` - displaying requests to the server in the console
* `placeholders` - personalization substitution list *Dictionary\<String, String\>*

### Customization

Customization of the appearance of the cells and the reader occurs through the singleton of the class `InAppStory.shared`:

#### List
* `showCellTitle` - displaying story titles in a cell *\<Bool>*;
* `cellFont` - cell title font *\<UIFont>*;
* `cellTitleColor` - cell title color *\<UIColor>*;
* `cellBorderColor` - cell border color *\<UIColor>*;

#### Reader
* `swipeToClose` - closing the reader by swipe *\<Bool>*;
* `overScrollToClose` - closing the reader when scrolling through the last story *\<Bool>*;
* `placeholderElementColor` - slide preloader color *\<UIColor>*;
* `placeholderBackgroundColor` - slide preloader background color *\<UIColor>*;
* `gamePlaceholderTint` - default game loader tint color *\<UIColor>*;
* `muted` - mute/unmute the sound in the story *\<Bool>*; (*[Details](Samples/Sound.md)*)
* `likePanel` - displaying the bottom bar with likes (should be enabled in the console) *\<Bool>*;
* `favoritePanel` - displaying the bottom bar with favorites (should be enabled in the console) *\<Bool>*;
* `sharePanel` - displaying the bottom panel with sharing (should be enabled in the console) *\<Bool>*;
* `likeImage` - images for the like button *\<UIImage>*;
* `likeSelectedImage` - images for the selected like button *\<UIImage>*;
* `dislikeImage` - images for the dislike button *\<UIImage>*;
* `dislikeSelectedImage` - images for the selected dislike button *\<UIImage>*;
* `favoriteImage` - images for favorites button *\<UIImage>*;
* `favoriteSelectedImag` - images for selected favorites button *\<UIImage>*;
* `shareImage` - images for sharing button *\<UIImage>*;
* `shareSelectedImage` - images for selected sharing button *\<UIImage>*;
* `placeholderView` - custom loader, should implement the protocol *<[PlaceholderProtocol](https://github.com/inappstory/ios-sdk#PlaceholderProtocol)>*;
* `gamePlaceholderView` - a custom game loader with progress, should implement the protocol *<[GamePlaceholderProtocol](https://github.com/inappstory/ios-sdk#GamePlaceholderProtocol)>*;
* `closeButtonPosition` - the position of the close button relative to the timers *<[ClosePosition](https://github.com/inappstory/ios-sdk#ClosePosition)>*;
* `scrollStyle` - animation style for slide transitions *<[ScrollStyle](https://github.com/inappstory/ios-sdk#ScrollStyle)>*;
* `presentationStyle` - reader display style *<[PresentationStyle](https://github.com/inappstory/ios-sdk#PresentationStyle)>*;

## StoryView

The main class for working with lists of stories.

### Initialization
---
**Remark**  
If the *settings* parameter was not specified for `InAppStory`, before initializing `StoryView`, it should be set:

```swift
InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>?>)
```
---

If the parameter `favorite: <Bool?>` is equal true, the list will be displayed favorite stories.

```swift
var storyView: StoryView!
    
override func viewDidLoad() {
	super.viewDidLoad()
	
   	storyView = StoryView(frame: <CGRect>, favorite: <Bool?>)
	storyView.target = <UIViewController>
        
	view.addSubview(storyView)
        
	storyView.create()
}
```

### Methods

* `create` - running internal StoryView logic;
* `refresh` - refresh stories list;
* `clear` - clear cache of images;
* `closeStory(complete: () -> Void)` - closing the story reader with a closure, `complete` is called after the reader is closed;
* `present(controller presentingViewController: <UIViewController>, with transitionStyle: <UIModalTransitionStyle>)` - displaying a custom controller on top of the story reader.

### Parameters and properties

* `delegate` - should implement the protocol *<[StoryViewDeleagate](https://github.com/inappstory/ios-sdk#StoryViewDeleagate)>*;
* `deleagateFlowLayout` - should implement the protocol *<[StoryViewDeleagateFlowLayout](https://github.com/inappstory/ios-sdk#StoryViewDeleagateFlowLayout)>*;
* `tags` - list of tags for content filtering *\<Array\<String>>*;
* `target` - controller for reader display *\<UIViewController>*;
* `isContent` - there is any content in the list of stories *\<Bool>*;
* `storyCell` - custom cell, should implement the protocol *<[StoryCellProtocol!](https://github.com/inappstory/ios-sdk#StoryCellProtocol)>*;
* `favoriteCell` - custom favorites cell, should implement the protocol *<[FavoriteCellProtocol!](https://github.com/inappstory/ios-sdk#FavoriteCellProtocol)>*;

## OnboardingStory

Onboarding is used to display stories not present in the main list.

### Presentation
---
**Remark**  
If the *settings* parameter was not specified for `InAppStory`, before showing onboarding, it should be set:

```swift
InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>?>)
```
---

To display onboarding, you need to set `onboardingDelegate` and call the `showOnboarding` method of the singleton class `InAppStory.shared`:

```swift
InAppStory.shared.showOnboarding(from target: <UIViewController>, delegate: <OnboardingDelegate>, complete: <()->Void>)
```

To close the reader of onboarding, call `closeOnboarding(complete: () -> Void)`. This may be necessary, such as when handling open the link by push a button in story. `complete` called after closing the reader.

## SingleStory

Used to display stories by their id or slug.

### Presentation
---
**Remark**  
If the *settings* parameter was not specified for `InAppStory`, before showing single story, it should be set:

```swift
InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>?>)
```
---

To display single story, you need to set `singleStoryDelegate` and call the `showSingleStory` method of the singleton class `InAppStory.shared`:

```swift
InAppStory.shared.showSingleStory(from target: <UIViewController>, with id: <String>, delegate: <SingleStoryDelegate>, complete: <()->Void>)
```

To close the reader of single story, call `closeSingleStory(complete: () -> Void)`. This may be necessary, such as when handling open the link by push a button in story. `complete` called after closing the reader.

## Protocols

### StoryViewDeleagate

* `storyViewUpdated(storyView: <StoryView>, widgetStories: Array<WidgetStory>?)` - called after the contents of the list are updated;
* `storyView(_ storyView: <StoryView>, actionWith type: <ActionType>, for target: <String>)
` - called after a link is received from stories with the interaction type *<[ActionType](https://github.com/inappstory/ios-sdk#ActionType)>*;
* `storyReaderWillShow()` - called before the reader will show;;
* `storyReaderDidClose()` - called after closing the story reader;
* `favoriteCellDidSelect()` - called when the favorite cell has been selected;

### StoryViewDeleagateFlowLayout

Methods of delegate, like in UICollectionViewDelegateFlowLayout

* `sizeForItemAt() -> <CGSize>` - returns the cell size for the list;
* `insetForSection() -> <UIEdgeInsets>` - returns padding from the edges of the list for cells;
* `minimumLineSpacingForSection() -> <CGFloat>` - returns the vertical padding between cells in a list;
* `minimumInteritemSpacingForSection() -> <CGFloat>` - returns horizontal padding between cells in a list;

### OnboardingDelegate

* `onboardingUpdated(isContent: <Bool>)` - called after the contents of the list are updated;
* `onboardingReader(actionWith target: <String>, for type: <ActionType>)` - called after a link is received from stories with the interaction type *<[ActionType](https://github.com/inappstory/ios-sdk#ActionType)>*;
* `onboardingReaderWillShow()` - called before the reader will show;
* `onboardingReaderDidClose()` - called after closing the story reader;

### SingleStoryDelegate

* `singleStoryUpdated(isContent: <Bool>)` - called after a single story is received;
* `singleStory(actionWith target: <String>, for type: <ActionType>)` - called after a link is received from stories with the interaction type *<[ActionType](https://github.com/inappstory/ios-sdk#ActionType)>*;
* `singleStoryReaderWillShow()` - called before the reader will show;
* `singleStoryReaderDidClose()` - called after closing the story reader;

### PlaceholderProtocol  

* `isAnimate: Bool { get }` - returns the state of the animation
* `start` - start animation
* `stop` - stop animation

### GamePlaceholderProtocol  

* `func setProgress(progress: Double)` - setting the progress value (0.0 - 1.0)

### StoryCellProtocol

* `reuseIdentifier: <String> { get }` - returns cell reuse identifier;
* `nib: <UINib?> { get }` - returns the nib of the cell's visual representation; 
* `setTitle(_ text: <String>)` - story title;
* `setImageURL(_ url: <URL>)` - image url for cover;
* `setVideoURL(_ url: <URL>)` - video url for animated cover;
* `setOpened(_ value: <Bool>)` - set new state if story is opened;
* `setHighlight(_ value: <Bool>)` - set new state if story cell if highlighted;
* `setBackgroundColor(_ color: <UIColor>)` - background color of cell;
* `setTitleColor(_ color: <UIColor>)` - title color of cell;
* `setSound(_ value: Bool)` - does the story have sound;

### FavoriteCellProtocol

* `reuseIdentifier: <String> { get }` - returns cell reuse identifier;
* `nib: <UINib?> { get }` - returns the nib of the cell's visual representation;  

* `favoritesCount: Int { get set }` - total count of stories in favorites;
* `setHighlight(_ value: <Bool>)` - set new state if story cell if highlighted;
* `setImages(_ urls: <Array<URL?>>)` - a list of addresses of the first four images stories in favorites;
* `setImagesColors(_ colors: <Array<UIColor?>>)` - a list of background colors of the first four stories in favorites;
* `setBackgroundColor(_ color: <UIColor>)` - main background color of a cell;

## enum

### ScrollStyle

Story transition animation style in reader:  

* `.flat` - usual, one after another, like UIScrollView;
* `.cover` - covered with next slide;
* `.cube` - in the form of a 3D cube;


### PresentationStyle

Reader display animation style:

* `.crossDissolve` - showing reader from transparency;
* `.modal` - modal reader display;

### ClosePosition

Position of the close button on the card in the reader:

* `.left` - to the left of the timers;
* `.right` - to the right of the timers;
* `.bottomLeft` - on the left under the timers;
* `.bottomRight` - on the right under the timers;

### ActionType

The action by which the link was obtained:

* `.button` - push the button;
* `.swipe` - swipe up slide.

## Objects

### Settings

#### Parameters

* `userID` - unique user identifier *\<String>*;
* `tags` - list of tags for content filtering *\<Array\<String>>*;

### WidgetStory

#### Parameters

* `id` - unique identifier of story *\<String>*;
* `title` - story title *\<String>*;
* `image` - link to cover image *\<String>*;
* `color` - background color of the story in HEX format *\<String>*;

## NotificationCenter

### Events

Standard fields `userInfo`: `id`, `title`,` tags`, `slidesCount`. The exception is `StoriesLoaded`

* `StoriesLoaded` - the list of stories has loaded, `StoryView` is ready to work (fires every time the list is loaded, and also on refresh). In `userInfo` only field `count` - stories count;
* `ClickOnStory` - click on story in the list with additional parameters:
    * place where the click came from (`list` or `favorite`);
* `ShowStory` - display of the story reader with additional parameters:
    * `source` - place where the showing came from (`direct`, `onboarding`, `list` or `favorite`);
* `CloseStory` - closing story with additional parameters:
    * `index` - index of the slide from which the closure occurred,
    * `action` - closing action (`swipe`, `click`, `auto` or `custom`),
    * `source` - place where the closing came from (`direct`, `onboarding`, `list` or `favorite`);
* `ClickOnButton` - click on the button in the story with additional parameters:
    * `index` - index of the slide from which the get link,
    * `link` - string link;
* `ShowSlide` - show slide with additional parameters:
    * `index` - index of the slide that now show;
* `LikeStory` - story like with additional parameters:
    * `index` - index of the slide which "like" pressed,
    * `value` - value of "like" position (`true` - is like, `false` - isn't like);
* `DislikeStory` - story dislike with additional parameters:
    * `index` - index of the slide which "dislike" pressed,
    * `value` - value of "dislike" position (`true` - is dislike, `false` - isn't dislike);
* `FavoriteStory` - adding story to favorites with additional parameters:
    * `index` - index of the slide which "favorite" pressed,
    * `value` - value of "favorite" position (`true` - is favorite, `false` - isn't favorite);
* `ClickOnShareStory` - pushing the share button with additional parameters:
    * `index` - index of the slide which "share" pressed;
* `StartGame` - opening the reader with the game with additional parameters:
    * `index` - index of the slide which game start;
* `CloseGame` - closing the reader with the game with additional parameters:
    * `index` - index of the slide which game closed;
* `FinishGame` - closing the game at the end with additional parameters:
    * `index` - index of the slide which game finished,
    * `result<Dictionary<String, Any>?>` - game end results;

### Errors

In error notifications, `userInfo` also comes in the form of a dictionary `["errorMessage": <Error_message_string>]`

* `SessionFailure` - session error;
* `StoryFailure` - error in story;
* `CurrentStoryFailure` - error when loading full story information;
* `NetworkFailure` - network error (no internet);
