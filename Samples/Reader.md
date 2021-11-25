# Reader customization

#### Change the appearance of the reader:

1. [Close button position](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/Reader.md#Close-button-position)
2. [Changing icons in the bottom panel](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/Reader.md#Changing-icons-in-the-bottom-panel)
3. [Changing the preloader on unloaded cards](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/Reader.md#Changing-the-preloader-on-unloaded-cards)
4. [Presentation style](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/Reader.md#Presentation-style)
5. [Swipe animation](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/Reader.md#Swipe-animation)
6. [Timers gradient](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/Reader.md#timers-gradient)

### Close button position

When initializing a library in an application, you can specify `closeButtonPosition`. The default is `.right`.
There are 4 positions of the "Close" button in the library:

* right - on the right, at the timer level
* left - to the left, at the timer level
* bottomRight - on the right, under the timer level
* bottomLeft - on the left, under the timer level

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // settings can also be specified at any time before creating a StoryView or calling individual stories 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    // close button position
    InAppStory.shared.closeButtonPosition = <ClosePosition>
    
    return true
}
```

--
### Changing icons in the bottom panel

The bottom panel icons can be replaced with any images. Each button has 2 states, normal and highlighted. It is desirable to use the image size 24x24 pt.

To display the bottom panel with buttons, after initializing the library, specify the panel functionality and make sure that this functionality is available and enabled in the console. Next, indicate all the options for the required pictures.

##### AppDelegate.swift

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // settings can also be specified at any time before creating a StoryView or calling individual stories 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    InAppStory.shared.likePanel = <Bool> // enable button bar with likes
    InAppStory.shared.favoritePanel = <Bool> // enable button bar with favorites
    InAppStory.shared.sharePanel = <Bool> // enable button bar with sharing
    
    InAppStory.shared.likeImage = <UIImage>
    InAppStory.shared.likeSelectedImage = <UIImage>
    InAppStory.shared.dislikeImage = <UIImage>
    InAppStory.shared.dislikeSelectedImage = <UIImage>
    InAppStory.shared.favoriteImage = <UIImage>
    InAppStory.shared.favoriteSelectedImag = <UIImage>
    InAppStory.shared.shareImage = <UIImage>
    InAppStory.shared.shareSelectedImage = <UIImage>
    
    // change sound icons
    InAppStory.shared.soundImage = <UIImage> // Sound on
    InAppStory.shared.soundSelectedImage = <UIImage> // Sound off
    
    return true
}
```
--

### Changing the preloader on unloaded cards

During the first download and when swiping, a preloader may be displayed until the story content is loaded.

The animation of the preloader can be changed, for this you need to create a `UIView` and implement the `PlaceholderProtocol` protocol in it. After initializing the library, point it to the library.

##### CustomPlaceholderView.swift
```swift
class CustomPlaceholderView: UIView, PlaceholderProtocol
{
    var isAnimate: Bool {
        get {
            return <Bool> // animation state value
        }
    }
    
    func start() {
        // start animation
    }
    
    func stop() {
        // stop animation
    }
}
```

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // settings can also be specified at any time before creating a StoryView or calling individual stories 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)

    // seting custom placeholder view to InAppStory
    InAppStory.shared.placeholderView = CustomPlaceholderView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
    
    return true
}
```
--
### Presentation style

The reader can be shown in two types of animation:

* crossDissolve - alpha animation from 0 to 1
* modal - reader show from under the bottom of the screen

Setting the type of animation is carried out after initializing the library in the application.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // settings can also be specified at any time before creating a StoryView or calling individual stories  
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)

    // setting reader animation style
    InAppStory.shared.presentationStyle = <PresentationStyle>
    
    return true	
}
```
--
### Swipe animation

Scrolling through stories in the reader can be represented by several animations:

* flat - simple sequential tiling
* cover - overlapping the previous story with the next one with the effect of parallax
* cube - each story is on the side of the cube (like instagram)

Setting the type of animation is carried out after initializing the library in the application.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // settings can also be specified at any time before creating a StoryView or calling individual stories 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)

    // setting swipe animation style
    InAppStory.shared.scrollStyle = <ScrollStyle>
    
    return true
}
```
--
### Timers gradient
    
If you need to remove the gradient at the top of the story (below the timers), you can use the `timerGradientEnable` parameter. By default, the gradient is on.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // settings can also be specified at any time before creating a StoryView or calling individual stories 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)

    // enable gradient shadow under timers
    InAppStory.shared.timerGradientEnable = <Bool>
    
    return true
}
```