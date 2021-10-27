# SingleStory

This type of story is opened by the specified `id` or `slug`. It can be used open from a push notification or be tied to an entity in an app (like a poll or trailer).

To display single story, you need to initialize InAppStory library in the project.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
     
    // settings can also be specified at any time before creating a StoryView or calling individual stories 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    return true
}
```

In the controller, where it is necessary to show a single story, call the `showSingleStory` method on `InAppStory`.

##### ViewController.swift

```swift 
... 

func pushNotification() {
    InAppStory.shared.showSingle(with: <String>, from: <UIViewController>, delegate: <InAppStoryDelegate>) {
        // the closure is triggered when the single story reader is opened
    }
}
...
```

To track the actions of the single story reader, you need to implement the `InAppStoryDelegate ` methods

##### ViewController.swift

```swift 
extension ViewController: InAppStoryDelegate
{
    func storiesDidUpdated(isContent: Bool, from storyType: StoriesType, storyView: StoryView?) {
        // called when the contents of the list are updated
    }
    
    // called when a button or SwipeUp event is triggered in the reader
    func storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType, storyView: StoryView?) {
        if type == .swipe { // link obtained by swipeUP action
           if let url = URL(string: target) {
               let swipeContentController = SwipeContentController()
               // passing link to controller with WebView
               swipeContentController.linkURL = url
               
               if storyType == .single {
	               // opening the controller on top of the reader
	               InAppStory.shared.singlePresent(controller: swipeContentController)
               }
           }
       } else {
            // if the processed link leads to a screen in the application, 
            // it is recommend to close the reader
            InAppStory.shared.closeReader {
                // processing a link, for example, to follow it in safari
                if let url = URL(string: target) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    func storyReaderWillShow(with storyType: StoriesType, storyView: StoryView?) { 
        // called before the reader will show
    }
    
    func storyReaderDidClose(with storyType: StoriesType, storyView: StoryView?) { 
        // called after closing the story reader
    }
}
```