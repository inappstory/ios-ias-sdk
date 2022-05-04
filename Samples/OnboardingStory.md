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

### Default Onboardings

In the controller, where you want to show onboarding, call the `showOnboarding` method of the `InAppStory`.  
By default (if `feed: <String>` is not specified), the feed marked in the console as "Onboarding" will be displayed.

##### ViewController.swift
```swift 
... 

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    InAppStory.shared.showOnboardings(from: <UIViewController>, delegate: <InAppStoryDelegate>) { show in
        // the closure is triggered when the onboarding reader is opened
        // show: <Bool> - if the reader was presented on the screen, value is true
    }
}
...
```

### Custom tags Onboardings

For onboarding, you can set a list of tags other than those set in `InAppStory.shared.settings`. Tags set in this way completely override the tags set in `InAppStory.shared.settings` for a particular onboarding call.

##### ViewController.swift
```swift 
... 

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    // feed - custom feed id;
    // from - controller for showing reader;
    // with - array of castom tads;
    // delegate - delegate for onbording reader;
    InAppStory.shared.showOnboardings(feed: <String> = "AboutFeed", from: <UIViewController>, with: ["Array with new tags"], delegate: <InAppStoryDelegate>) { show in
        // the closure is triggered when the onboarding reader is opened
        // show: <Bool> - if the reader was presented on the screen, value is true
    }
}
...
```

### Custom feed Onboardings

In onboarding, you can show any feed from the list in the console. To show a non-default feed, you must specify `feed: <String>` when calling the `showOnboarding` method of the `InAppStory`.

##### ViewController.swift
```swift 
... 

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    InAppStory.shared.showOnboardings(feed: <String> = "AboutFeed", from: <UIViewController>, delegate: <InAppStoryDelegate>) { show in
        // the closure is triggered when the onboarding reader is opened
        // show: <Bool> - if the reader was presented on the screen, value is true
    }
}
...
```
> **Pay attention**  
> Displaying any feed in onboarding works according to onboarding rules. Stories are shown only once per user. The next time you try to show the read story in onboarding, it will be cut off.

### Onboardings actions

To track the actions of the onboarding reader, you need to implement the `InAppStoryDelegate` methods

```swift 
extension ViewController: InAppStoryDelegate
{
    func storiesDidUpdated(isContent: Bool, from storyType: StoriesType) {
        // called when the contents of the list are updated
    }
    
    // called when a button or SwipeUp event is triggered in the reader
    func storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType) {
        switch storyType {
        case .list(let listFeed):
            print("List feed is \(listFeed)") // stories list feed id
        case .onboarding(let onboardingFeed):
            print("Onboarding feed is \(onboardingFeed)") // onboarding list feed id
        default:
            print("Feed is not set") // by favorites or sigle
        }
        
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
       } else { // .button, .game, .deeplink
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