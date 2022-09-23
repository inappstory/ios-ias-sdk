# InAppStory

A library for embedding stories into an application with customization.

## Contents

* [Installation](https://github.com/inappstory/ios-sdk#Installation)
	* [CocoaPods](https://github.com/inappstory/ios-sdk#CocoaPods)
	* [Carthage](https://github.com/inappstory/ios-sdk#Carthage)
	* [Swift Package Manager](https://github.com/inappstory/ios-sdk#Swift-Package-Manager)
	* [Manual installation](https://github.com/inappstory/ios-sdk#Manual-installation)
	* [Library import](https://github.com/inappstory/ios-sdk#Library-import)
* [Migration](https://github.com/inappstory/ios-sdk#Migration)
* [InAppStory](https://github.com/inappstory/ios-sdk#InAppStory)
	* [Initialization](https://github.com/inappstory/ios-sdk#Initialization)
	* [Methods](https://github.com/inappstory/ios-sdk#Methods)
	* [Parameters and properties](https://github.com/inappstory/ios-sdk#Parameters-and-properties)
	* [Customization](https://github.com/inappstory/ios-sdk#Customization)
* [StoryView](https://github.com/inappstory/ios-sdk#StoryView)
	* [Initialization](https://github.com/inappstory/ios-sdk#Initialization-1)
	* [Methods](https://github.com/inappstory/ios-sdk#Methods-1)
	* [Parameters and properties](https://github.com/inappstory/ios-sdk#Parameters-and-properties-1)
* [OnboardingStory](https://github.com/inappstory/ios-sdk#OnboardingStory)
	* [Presentation](https://github.com/inappstory/ios-sdk#Presentation)
* [SingleStory](https://github.com/inappstory/ios-sdk#SingleStory)
	* [Presentation](https://github.com/inappstory/ios-sdk#Presentation-1)
* [Protocols](https://github.com/inappstory/ios-sdk#Protocols)
	* [InAppStoryDelegate](https://github.com/inappstory/ios-sdk#InAppStoryDelegate)
	* [GoodsDelegateFlowLayout](https://github.com/inappstory/ios-sdk#GoodsDelegateFlowLayout)
	* [StoryViewDelegateFlowLayout](https://github.com/inappstory/ios-sdk#StoryViewDelegateFlowLayout)
	* [PlaceholderProtocol](https://github.com/inappstory/ios-sdk#PlaceholderProtocol)
	* [DownloadPlaceholderProtocol](https://github.com/inappstory/ios-sdk#DownloadPlaceholderProtocol)
	* [StoryCellProtocol](https://github.com/inappstory/ios-sdk#StoryCellProtocol)
	* [FavoriteCellProtocol](https://github.com/inappstory/ios-sdk#FavoriteCellProtocol)
	* [EditorCellProtocol](https://github.com/inappstory/ios-sdk#EditorCellProtocol)
* [enum](https://github.com/inappstory/ios-sdk#enum)
	* [ActionType](https://github.com/inappstory/ios-sdk#ActionType)
	* [StoriesType](https://github.com/inappstory/ios-sdk#StoriesType)
	* [ScrollStyle](https://github.com/inappstory/ios-sdk#ScrollStyle)
	* [PresentationStyle](https://github.com/inappstory/ios-sdk#PresentationStyle)
	* [ClosePosition](https://github.com/inappstory/ios-sdk#ClosePosition)
	* [ActionType](https://github.com/inappstory/ios-sdk#ActionType)
	* [GoodsFailure](https://github.com/inappstory/ios-sdk#GoodsFailure)
* [Objects](https://github.com/inappstory/ios-sdk#Objects)
	* [Settings](https://github.com/inappstory/ios-sdk#Settings)
	* [PanelSettings](https://github.com/inappstory/ios-sdk#PanelSettings)
	* [TimersGradient](https://github.com/inappstory/ios-sdk#TimersGradient)
	* [WidgetStory](https://github.com/inappstory/ios-sdk#WidgetStory)
	* [CustomGoodsView](https://github.com/inappstory/ios-sdk#CustomGoodsView)
* [NotificationCenter](https://github.com/inappstory/ios-sdk#NotificationCenter)
	* [Events](https://github.com/inappstory/ios-sdk#Events)
	* [Errors](https://github.com/inappstory/ios-sdk#Errors)
* [Samples](Samples/Samples.md)

## Installation

| InAppStory version | Build version | iOS version |
|--------------------|---------------|-------------|
| 1.18.0             | 2329          | >= 10.0     |

Version of the library can be obtained from the parameter `InAppStory.buildInfo`


### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate InAppStory into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!
pod 'InAppStory', :git => 'https://github.com/inappstory/ios-sdk.git'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate InAppStory into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "inappstory/ios-sdk" ~> 1.18.0
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but InAppStory does support its use on supported platforms.

Once you have your Swift package set up, adding InAppStory as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/inappstory/ios-sdk.git", .upToNextMajor(from: "1.18.0"))
]
```

### Manual installation

Download `InAppStorySDK.xcframework` from the repository. Connect in the project settings on the *General* tab.


### Library import

##### Objective-C

```objective-c
#import <InAppStorySDK/InAppStorySDK.h>
```

##### Swift

```swift
import InAppStorySDK
```
## Migration

* from InAppStorySDK - v 1.8.x -> [Migration guide to 1.9.0](Migration-1.9.0.md)
* from InAppStorySDK - v 1.9.x -> [Migration guide to 1.10.0](Migration-1.10.0.md)
* from InAppStorySDK - v 1.10.x -> [Migration guide to 1.11.0](Migration-1.11.0.md)
* from InAppStorySDK - v 1.14.x -> [Migration guide to 1.15.0](Migration-1.15.0.md)
* from InAppStorySDK - v 1.15.x -> [Migration guide to 1.16.0](Migration-1.16.0.md)

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

* `setTags(<Array<String>>)` - replacing all tags;
* `addTags(<Array<String>>)` - adding tags;
* `removeTags(<Array<String>>)` - remove tags;
* `getWidgetStories(complete: (Array<WidgetStory>?) -> Void)` - getting a list of stories for a widget;
* `showOnboardings(from target: <UIViewController>, delegate: <InAppStoryDelegate>, complete: @escaping (_ show: Boll) -> Void)` - show onboarding reader, also see *<[InAppStoryDelegate](https://github.com/inappstory/ios-sdk#InAppStoryDelegate)>*
* `onboardingPresent(controller presentingViewController: <UIViewController>, with transitionStyle: <UIModalTransitionStyle>)` - serves for display of a custom controller over onboarding stories;
* `showSingle(with id: <String>, from target: <UIViewController>, delegate: <InAppStoryDelegate>, complete: @escaping (_ show: Bool) -> Void)` - show single reader, also see *<[InAppStoryDelegate](https://github.com/inappstory/ios-sdk#InAppStoryDelegate)>*
* `singleStoryPresent(controller presentingViewController: <UIViewController>, with transitionStyle: <UIModalTransitionStyle>)` - serves for display of a custom controller over a single story;
* `closeReader(complete: () -> Void)` - closing any story reader that showinng with a closure, `complete` is called after the reader is closed;
* `clearCache` - clear all cache of library;
* `removeFromFavorite(with storyID: <String>)` - remove story from favorites;
* `removeAllFavorites()` - remove all favorites stories;

### Parameters and properties
* `isReaderOpen` - show that reader is open on screen or not *nil* in *InAppStory.shared*
* `favoritesCount` - the number of favorite stories a user has;
* `isLoggingEnabled` - displaying requests to the server in the console;
* `isEditorEnabled` - displaying editor cell in sories lists; ([InAppStoryUGC](https://github.com/inappstory/ios-ugc-sdk))
* `isEditorShowing` - is editor current displaying; ([InAppStoryUGC](https://github.com/inappstory/ios-ugc-sdk))
* `placeholders` - personalization substitution list *Dictionary\<String, String\>*;
* `imagesPlaceholders` - images personalization substitution list *Dictionary\<String, String\>*;
* `widgetStories` - data for iOS widget.
* `sslPinningHashKeys` - hashs of public keys for SSL-Pinning *Array<String>?*

### Customization

Customization of the appearance of the cells and the reader occurs through the singleton of the class `InAppStory.shared`:

#### List
* `coverQuality` - quality of cover images in cells *\<[Quality](https://github.com/inappstory/ios-sdk#Quality)>*;
* `showCellTitle` - displaying story titles in a cell *\<Bool>*;
* `cellFont` - cell title font *\<UIFont>*;
* `cellBorderColor` - cell border color *\<UIColor>*;
* `cellBorderRadius` - radius of default cell borders *\<CGFloat>*;


#### Goods widget

* `goodsCellMainTextColor` - default goods item cell text color *\<UIColor>*;
* `goodsCellDiscountTextColor` - default goods item cell discount text color *\<UIColor>*;
* `goodCellTitleFont` - default goods item cell title font *\<UIFont>*;
* `goodCellSubtitleFont` - default goods item cell subtitle font *\<UIFont>*;
* `goodCellPriceFont` - default goods item cell price font *\<UIFont>*;
* `goodCellDiscountFont` - default goods item cell discount font *\<UIFont>*;
* `goodsCloseBackgroundColor` - close button background color *\<UIColor>*;
* `goodsSubstrateColor` - backround color under goods list *\<UIColor>*;
* `refreshGoodsImage` - images for refresh button *\<UIImage>*;
* `goodsCloseImage` - images for close button *\<UIImage>*;
* `goodCell` - custom cell, should implement the protocol *<[GoodsCellProtocol](https://github.com/inappstory/ios-sdk#GoodsCellProtocol)>*;
* `goodsView` - custom goods view, should inherit from *<[CustomGoodsView](https://github.com/inappstory/ios-sdk#CustomGoodsView)>*;
* `goodsDelegateFlowLayout` - should implement the protocol *<[GoodsDelegateFlowLayout](https://github.com/inappstory/ios-sdk#GoodsDelegateFlowLayout)>*;

#### Reader
* `swipeToClose` - closing the reader by swipe *\<Bool>*;
* `overScrollToClose` - closing the reader when scrolling through the last story *\<Bool>*;
* `placeholderElementColor` - slide preloader color *\<UIColor>*;
* `placeholderBackgroundColor` - slide preloader background color *\<UIColor>*;
* `gamePlaceholderTint` - default game loader tint color *\<UIColor>*;
* `muted` - mute/unmute the sound in the story *\<Bool>*; (*[Details](Samples/Sound.md)*)
* `timerGradientEnable` - enable gradient shadow under timers in story *\<Bool>*;
* `timerGradient` - shadow gradient at the top of the story below the timers *\<TimersGradient>*;
* `panelSettings` - displaying the bottom bar (should be enabled in the console) *\<PanelSettings>*; (*[Details](Samples/PanelSettings.md)*)
* `likeImage` - images for the like button *\<UIImage>*;
* `likeSelectedImage` - images for the selected like button *\<UIImage>*;
* `dislikeImage` - images for the dislike button *\<UIImage>*;
* `dislikeSelectedImage` - images for the selected dislike button *\<UIImage>*;
* `favoriteImage` - images for favorites button *\<UIImage>*;
* `favoriteSelectedImag` - images for selected favorites button *\<UIImage>*;
* `shareImage` - images for sharing button *\<UIImage>*;
* `shareSelectedImage` - images for selected sharing button *\<UIImage>*;
* `placeholderView` - custom loader, should implement the protocol *<[PlaceholderProtocol](https://github.com/inappstory/ios-sdk#PlaceholderProtocol)>*;
* `gamePlaceholderView` - a custom game loader with progress, should implement the protocol *<[DownloadPlaceholderProtocol](https://github.com/inappstory/ios-sdk#DownloadPlaceholderProtocol)>*;
* `closeReaderImage` - image for reader's close button *\<UIImage>*. Recommended 24pt;
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

To use the multi-feed function, `feed: <String>` must be set. By default, this is an empty string, and the list loads the main feed from the console.
If the parameter `favorite: <Bool?>` is equal true, the list will be displayed favorite stories.

```swift
var storyView: StoryView!
    
override func viewDidLoad() {
	super.viewDidLoad()
	
   	storyView = StoryView(frame: <CGRect> = .zero, feed: <String> = "", favorite: <Bool> = false)
	storyView.target = <UIViewController>
        
	view.addSubview(storyView)
        
	storyView.create()
}
```

### Methods

* `create` - running internal StoryView logic;
* `refresh` - refresh stories list;
* `clear` - clear cache of images;
* `present(controller presentingViewController: <UIViewController>, with transitionStyle: <UIModalTransitionStyle>)` - displaying a custom controller on top of the story reader.

### Parameters and properties

* `storiesDelegate` - should implement the protocol *<[InAppStoryDelegate](https://github.com/inappstory/ios-sdk#InAppStoryDelegate)>*;
* `deleagateFlowLayout` - should implement the protocol *<[StoryViewDelegateFlowLayout](https://github.com/inappstory/ios-sdk#StoryViewDelegateFlowLayout)>*;
* `panelSettings` - displaying the bottom bar (overwrite `InAppStory.shared.panelSettings`) *\<PanelSettings>*; (*[Details](Samples/PanelSettings.md)*)
* `target` - controller for reader display *\<UIViewController>*;
* `isContent` - there is any content in the list of stories *\<Bool>*;
* `storyCell` - custom cell, should implement the protocol *<[StoryCellProtocol!](https://github.com/inappstory/ios-sdk#StoryCellProtocol)>*;
* `favoriteCell` - custom favorites cell, should implement the protocol *<[FavoriteCellProtocol!](https://github.com/inappstory/ios-sdk#FavoriteCellProtocol)>*;
* `editorCell` - custom editor cell, should implement the protocol *<[EditorCellProtocol!](https://github.com/inappstory/ios-sdk#EditorCellProtocol)>*;

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

To display onboarding, you need call the `showOnboardings` method of the singleton class `InAppStory.shared`:

```swift
InAppStory.shared.showOnboardings(feed: <String> = "", from target: <UIViewController>, with tags: [String]? = nil, delegate: <InAppStoryDelegate>, with panelSettings: PanelSettings? = nil, complete: <()->Void>)
```

Also, in the onboarding, you can show a separate list specified in the console. To do this, you must specify the `feed: <String>` parameter related to the feed. By default, this is an empty string, and the list loads the oboarding feed from the console.

`tags: [String]?` - override InAppStory settings tags;

Parametr `panelSettings` displaying the bottom bar (overwrite `InAppStory.shared.panelSettings`) *\<PanelSettings>*; (*[Details](Samples/PanelSettings.md)*)

To close the reader of onboarding, call `closeReader(complete: () -> Void)`. This may be necessary, such as when handling open the link by push a button in story. `complete` called after closing the reader.

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

To display single story, you need call the `showSingle` method of the singleton class `InAppStory.shared`:

```swift
InAppStory.shared.showSingle(from target: <UIViewController>, with id: <String>, delegate: <InAppStoryDelegate>, with panelSettings: PanelSettings? = nil, complete: <()->Void>)
```

Parametr `panelSettings` displaying the bottom bar (overwrite `InAppStory.shared.panelSettings`) *\<PanelSettings>*; (*[Details](Samples/PanelSettings.md)*)

To close the reader of single story, call `closeReader(complete: () -> Void)`. This may be necessary, such as when handling open the link by push a button in story. `complete` called after closing the reader.

## Protocols

### InAppStoryDelegate
* `storiesDidUpdated(isContent: <Bool>, from storyType: <StoriesType>, storyView: <StoryView>?)` - called after the contents are updated for sories type *<[StoriesType](https://github.com/inappstory/ios-sdk#StoriesType)>*;
* `storyReader(actionWith target: <String>, for type: <ActionType>, from storyType: <StoriesType>, storyView: <StoryView>?)` - called after a link is received from stories with the interaction type *<[ActionType](https://github.com/inappstory/ios-sdk#ActionType)>* and *<[StoriesType](https://github.com/inappstory/ios-sdk#StoriesType)>*;
* `storyReaderWillShow(with storyType: <StoriesType>, storyView: <StoryView>?)` - called before the reader will show *(optional)*;
* `storyReaderDidClose(with storyType: <StoriesType>, storyView: <StoryView>?)` - called after closing the story reader *(optional)*;
* `favoriteCellDidSelect()` - called when the favorite cell has been selected *(optional)*;
* `getGoodsObject(with skus: <Array<String>>, complete: <GoodsComplete>)` - get goods items from parent app with closure, *<[GoodsComplete](https://github.com/inappstory/ios-sdk#GoodsComplete)>*;
* `goodItemSelected(_ item: <Any>, with storyType: <StoriesType>, storyView: <StoryView>?)` - selected goods item in widget, with object sended in `getGoodsObject(...)`
* `editorWillShow()` - editor screen will show;
* `editorDidClose()` - editor screen did close;

### GoodsDelegateFlowLayout

Methods of delegate, like in UICollectionViewDelegateFlowLayout

* `sizeForItemAt() -> <CGSize>` - returns the cell size for the list;
* `insetForSection() -> <UIEdgeInsets>` - returns padding from the edges of the list for cells;
* `minimumLineSpacingForSection() -> <CGFloat>` - returns the vertical padding between cells in a list;

### StoryViewDelegateFlowLayout

Methods of delegate, like in UICollectionViewDelegateFlowLayout

* `sizeForItemAt() -> <CGSize>` - returns the cell size for the list;
* `insetForSection() -> <UIEdgeInsets>` - returns padding from the edges of the list for cells;
* `minimumLineSpacingForSection() -> <CGFloat>` - returns the vertical padding between cells in a list;
* `minimumInteritemSpacingForSection() -> <CGFloat>` - returns horizontal padding between cells in a list;

### PlaceholderProtocol  

* `isAnimate: <Bool> { get }` - returns the state of the animation
* `start` - start animation
* `stop` - stop animation

### DownloadPlaceholderProtocol  

* `func setProgress(progress: Double)` - setting the progress value (0.0 - 1.0)

### StoryCellProtocol

* `reuseIdentifier: <String> { get }` - returns cell reuse identifier;
* `nib: <UINib?> { get }` - returns the nib of the cell's visual representation; 
* `storyID: <String!> { get set }` - cell's story id;
* `setTitle(_ text: <String>)` - story title;
* `setImageURL(_ url: <URL>)` - image url for cover;
* `setVideoURL(_ url: <URL>)` - video url for animated cover;
* `setOpened(_ value: <Bool>)` - set new state if story is opened;
* `setHighlight(_ value: <Bool>)` - set new state if story cell if highlighted;
* `setBackgroundColor(_ color: <UIColor>)` - background color of cell;
* `setTitleColor(_ color: <UIColor>)` - title color of cell;
* `setSound(_ value: Bool)` - does the story have sound;

### GoodsCellProtocol

* `reuseIdentifier: <String> { get }` - returns cell reuse identifier;
* `nib: <UINib?> { get }` - returns the nib of the cell's visual representation; 
* `setGoodObject(_ object: <Any>!)` - object that comes from `getGoodsObject(...)`;

### FavoriteCellProtocol

* `reuseIdentifier: <String> { get }` - returns cell reuse identifier;
* `nib: <UINib?> { get }` - returns the nib of the cell's visual representation;  

* `favoritesCount: Int { get set }` - total count of stories in favorites;
* `setHighlight(_ value: <Bool>)` - set new state if story cell if highlighted;
* `setImages(_ urls: <Array<URL?>>)` - a list of addresses of the first four images stories in favorites;
* `setImagesColors(_ colors: <Array<UIColor?>>)` - a list of background colors of the first four stories in favorites;
* `setBackgroundColor(_ color: <UIColor>)` - main background color of a cell;

###EditorCellProtocol

* `reuseIdentifier: <String> { get }` - returns cell reuse identifier;
* `nib: <UINib?> { get }` - returns the nib of the cell's visual representation; 

## Closure

### GoodsComplete

Closure for contine `getGoodsObject(...)` method in *InAppStoryDelegate* - `(Result<Array<Any>, GoodsFailure>) -> Void`

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
* `.zoom` - display reader from list's cell;

### ClosePosition

Position of the close button on the card in the reader:

* `.left` - to the left of the timers;
* `.right` - to the right of the timers;
* `.bottomLeft` - on the left under the timers;
* `.bottomRight` - on the right under the timers;

### ActionType

The action by which the link was obtained:

* `.button` - push the button;
* `.swipe` - swipe up slide;
* `.game` - link from Game;
* `.deeplink` - deeplink from cell.

### StoriesType

The action by which the link was obtained:

* `.list(feed: <String>?)` - type for StoryView, `feed` - id stories list;
* `.single` - type for single story reader;
* `.onboarding(feed: <String>)` - type for onboarding story reader, `feed` - id stories list.

### Quality

Quality of cover images in cells

* `.medium`;
* `.high`.

### GoodsFailure

Failure that return in `Result` from `getGoodsObject(...)` closure

* `.refresh` - show refresh button in the *GoodsView*;
* `.close` - close *GoodsView*.

## Objects

### Settings

#### Parameters

* `userID` - unique user identifier *\<String>*;
* `tags` - list of tags for content filtering *\<Array\<String>>*;

### PanelSettings

#### Parameters

* `like` - displaying the bottom bar with likes (should be enabled in the console) *\<Bool>*;
* `favorites` - displaying the bottom bar with favorites (should be enabled in the console) *\<Bool>*;
* `share` - displaying the bottom panel with sharing (should be enabled in the console) *\<Bool>*;

### TimersGradient

#### Parameters

* `colors` - array of gradient colors *\<Array<UIColor>>*;
* `startPoint` - start point of gradient *\<CGPoint>*;
* `endPoint` - end point of gradient *\<CGPoint>*;
* `locations` - smooth gradient location *\<Array<Double>>*;
* `height` - the height of the gradient from the top edge of the story *\<Double>*;


### WidgetStory

#### Parameters

* `id` - unique identifier of story *\<String>*;
* `title` - story title *\<String>*;
* `image` - link to cover image *\<String>*;
* `color` - background color of the story in HEX format *\<String>*;

### CustomGoodsView

To create your own goods widget, you need to inherit from CustomGoodsView.

* `setSKUItems(_ items: Array<String>)` - set SKUs of goods from InAppStory reader;
* `setReaderFrame(_ frame: CGRect)` - set StoryReader frame;
* `final close()` - needs call from *superclass*, for close widget;
* `final goodsItemClick(with sku: <String>)` - send statistic in SDK;

## NotificationCenter

### Events

Standard fields `userInfo`: `id`, `title`,` tags`, `slidesCount`, `feed`. The exception is `StoriesLoaded`

* `StoriesLoaded` - the list of stories has loaded, `StoryView` is ready to work (fires every time the list is loaded, and also on refresh). In `userInfo` only field `count` - stories count & `feed` - stories feed id;
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
    * `payload` - innformation from console parametrs;
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
* `StoryWidgetEvent` - action in widget with parameters:
    * `index` - the index of the slide where the widget is located,
    * `widgetName` - name of widget,
    * `data<Dictionary<String, Any>?>` - activated widget data [detail data fields](https://github.com/inappstory/ios-sdk/blob/main/Docs/StoryWidgetEvent.md);

### Errors

In error notifications, `userInfo` also comes in the form of a dictionary `["errorMessage": <Error_message_string>]`

* `SessionFailure` - session error;
* `StoryFailure` - error in story;
* `CurrentStoryFailure` - error when loading full story information;
* `NetworkFailure` - network error (no internet);
