# Images Placeholders

Images placeholders sets that *\<Dictionary\<String, String>>* like *["\<key>" : "\<value>"]*.

*"\<key>"* of placeholder sets without symbols "%".
*"\<value>"* of image placeholder is a URL. The link can be either to a remote resource on the Internet or to a local file located in the application. The main thing is that the URL should pass iOS validation, i.e. `URL(string: <String>) != nil`

1) Placeholders can be set after initializing the library with setting and before creating the `StoryView`.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library settings object
    let settings = Settings(userID: <String>, tags: <Array<String>>)
    
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>, settings: settings)
    
    // dictionary of images placeholders like ["<key>" : "<value>"]
    InAppStory.shared.imagesPlaceholders = <Dictionary<String, String>>
    
    return true
}
```

2) Also, images placeholders can be set or change in portions after creating the `StoryView`. For the changes to take effect, you need to update the list (see [Refresh](Refresh.md))

> **Remark**  
> Onboarding and singles can also use images placeholders, but you don't need to call `refresh()` on the list to update them. The main thing is to set their value before calling the onboarding or single display.

##### ViewController.swift
```swift
var storyView: StoryView!

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //initialize StoryView
    view.addSubview(storyView) //add object to the view
    
    storyView.create() //running internal logic
}

// calling after StoryView is created
func setPlaceholders() {
    InAppStory.shared.imagesPlaceholders = <Dictionary<String, String>> // set images placeholders values
    
    storyView.refresh() //updating story list
}
```
> **Remark**  
> When sets images placeholders, it's a good idea to make sure they're up to date before calling `refresh()`.  
> You can also call `refresh()` right after the placeholders update methods.