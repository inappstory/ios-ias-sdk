# Onboarding Stories

This type of stories is a separate list that is configured in the console. It can be used to display welcome screens, advertisements, etc.

To display onboarding, you need to initialize InAppStory library in the project

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

In the controller, where you want to show onboarding, call the `showOnboarding` method of the `InAppStory`

##### ViewController.swift
```swift 
... 

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    InAppStory.shared.showOnboardings(from: <UIViewController>, delegate: <InAppStoryDelegate>) {
        // the closure is triggered when the onboarding reader is opened
    }
}
...
```

To track the actions of the onboarding reader, you need to implement the `InAppStoryDelegate` methods

```swift 
extension ViewController: InAppStoryDelegate
{
    func storiesDidUpdated(isContent: Bool, from storyType: StoriesType) {
        // called when the contents of the list are updated
    }
    
    // called when a button or SwipeUp event is triggered in the reader
    func storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType) {
        if type == .swipe { // link obtained by swipeUP action
           if let url = URL(string: target) {
               let swipeContentController = SwipeContentController()
               // passing link to controller with WebView
               swipeContentController.linkURL = url
               
               if storyType == .onboarding {
	               // opening the controller on top of the reader
	               InAppStory.shared.onboardingPresent(controller: swipeContentController)
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
    
    func storyReaderWillShow(with storyType: StoriesType) {
        // called before the reader will show
    }
    
    func storyReaderDidClose(with storyType: StoriesType) {
        // called after closing the story reader
    }
}
```