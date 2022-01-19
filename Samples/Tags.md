# Tags

1) Tags can be set when initializing the library with setting `userID`.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library settings object
    let settings = Settings(userID: <String>, tags: <Array<String>>)
    
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>, settings: settings)
    
    return true
}
```

2) Tags can be set with user settings after initializing the library through the `settings` parameter.

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

3) Also, tags can be added or removed in portions after creating the `StoryView`. For the changes to take effect, you need to update the list (see [Refresh](Refresh.md))

> **Remark**  
> Onboarding can also be displayed depending on tags, but you don't need to call `refresh()` on the list to update them

##### ViewController.swift
```swift
var storyView: StoryView!

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //initialize StoryView
    view.addSubview(storyView) //add object to the view
    
    storyView.create() //running internal logic
}

func addTags() {
    InAppStory.shared.addTags(<Array<String>>) //add tag list
    
    storyView.refresh() //updating story list
}

func removeTags() {
    InAppStory.shared.removeTags(<Array<String>>) //delete tag list
    
    storyView.refresh() //updating story list
}
```
> **Remark**  
>When adding or changing tags, it's a good idea to make sure they're up to date before calling `refresh()`.  
>You can also call `refresh()` right after the tag update methods.