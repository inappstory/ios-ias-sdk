# Link Handing

Links can come  from stories when you click on a button or using the swipeUP action.  
Stories can also be a link and be triggered without opening the reader.

To get links, you need to specify a delegate for `StoryView` and implement the method `storyView(_ storyView: <StoryView>, actionWith type: <ActionType>, for target: <String>)`, here are `storyView` is where the link came from, `type` is the way to open the link, and `target` is the text link.

For handling links from onboarding and single stories see [SingleStory](SingleStory.md) and [OnboardingStory](OnboardingStory.md)

1) To initialize InAppStory library in the project

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

2) Initialize `StoryView` in `ViewController`

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //StoryView initialization
    storyView.storiesDelegate = self
    
    view.addSubview(storyView) //adding an object to a view
    
    storyView.create() //running internal logic
}
```

3) To implement a delegate method for getting link

##### ViewController.swift
```swift
extension ViewController: InAppStoryDelegate
{
    ...
    
    // called when a button or SwipeUp event is triggered in the reader
    func storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType) {
       if type == .swipe { //link obtained by swipeUP action
           if let url = URL(string: target) {
               let swipeContentController = SwipeContentController()
               // passing link to controller with WebView
               swipeContentController.linkURL = url
               
               if storyType == .list {
	               // opening the controller on top of the reader
	               storyView.present(controller: swipeContentController)
               }
           }
       } else {
            // if the processed link leads to a screen in the application, 
            // recommend to close the reader
            storyView.closeReader {
                // processing a link, for example, to follow it in safari
                if let url = URL(string: target) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    ...
}
```