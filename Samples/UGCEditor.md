# UGC Editor

Starting from version 1.18.0 you can add a light editor to the project.  
Before including the editor in the SDK, you need to enable this function in the web console project settings.

>**Attention!**  
>For the UGC editor to work properly, you must install and import the [InAppStoryUGC](https://github.com/inappstory/ios-ugc-sdk).

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

2) Initialize `StoryView` in `ViewController` and set delegate for them. For enable the editor feature in the list, you need set the `isEditorEnabled` property to true

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView() //StoryView initialization
    storyView.storiesDelegate = self // set delegate
    storyView.isEditorEnabled = true // enable editor cell in list
    
    view.addSubview(storyView) //adding an object to a view
    
    storyView.create() //running internal logic
}
```

3) Implement delegate methods to track editor cell taps, and call method to show editor

##### ViewController.swift
```swift
extension ViewController: InAppStoryDelegate
{
    ...
    // calling after editor cell tapped
    func editorCellDidSelect()
    {
        // ugc editor payload (filter)
        let payloadUGC: Dictionary<String, Any?> = ["param1" : "param"]
        // show editor from target
        InAppStoryEditor.shared.showEditor(payload: payloadUGC,from: self, delegate: self) { show in
            // calling after present logic complete
            // if show is true that all ok, else see logs
        }
    }
    ...
}
```

4) To track the display and close of the editor, you can also implement delegate methods. See [Full list of events](https://github.com/inappstory/ios-ugc-sdk#ListOfDelegateEvents)

##### ViewController.swift
```swift
extension ViewController: InAppStoryEditorDelegate
{
    ...
    // all of editor events (editorWillShow, editorDidClose,...)
    func editorEvent(name: String, data: Dictionary<String, Any>) {...}
    ...
}
```

Next, in the controller, create a StoryView to display a list of stories.

6) The editor can be closed programmatically from the application. To do this, call the method on `InAppStoryEditor`

##### ViewController.swift
```swift
extension ViewController
{
    ...
    func closeEditor()
    {
        // close editor with completion
        InAppStoryEditor.shared.closeEditor {
            // calling after editor dismissing complete
        }
    }
    ...
}
```
> **Remark**  
> Closing the editor does not happen instantly, before closing it, internal logic is triggered before closing.

## UGC Approved stories list

The `StoryUGCView` must be used to display the list of stories added with the editor and approved. Initializing and working with the `StoryUGCView` is almost the same as working with the `StoryView`.

1) Initialize `StoryUGCView` in `ViewController` and set delegate for them. If you want to display the editor cell in list, you have to set the `isEditorEnabled` property to true. Also, when initializing `StoryUGCView`, you can set a filter to display only the necessary stories in the list.

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyUGCView = StoryUGCView(filter: ["param1": "parameter"]) //StoryUGCView initialization with filter
    storyUGCView.storiesDelegate = self // set delegate
    storyUGCView.isEditorEnabled = true // enable editor cell in list
    
    view.addSubview(storyUGCView) //adding an object to a view
    
    storyView.create() //running internal logic
}
```

2) Implement delegate methods to track editor cell taps, and call method to show editor

##### ViewController.swift
```swift
extension ViewController: InAppStoryDelegate
{
    ...
    // calling after editor cell tapped
    func editorCellDidSelect()
    {
        // ugc editor payload (filter)
        let payloadUGC: Dictionary<String, Any?> = ["param1" : "param"]
        // show editor from target
        InAppStoryEditor.shared.showEditor(payload: payloadUGC,from: self, delegate: self) { show in
            // calling after present logic complete
            // if show is true that all ok, else see logs
        }
    }
    ...
}
```

3) To track the display and close of the editor, you can also implement delegate methods. Editor full list of [events](https://github.com/inappstory/ios-ugc-sdk#ListOfDelegateEvents);

##### ViewController.swift
```swift
extension ViewController: InAppStoryEditorDelegate
{
    ...
    // all of editor events (editorWillShow, editorDidClose,...)
    func editorEvent(name: String, data: Dictionary<String, Any>) {...}
    ...
}
```

## Editor list cell customize

Cell customization, at the moment, implies a complete replacement with a custom one. To do this, you need to create a *UICollectionViewCell* cell that implements the `EditorCellProtocol` protocol and pass it to `StoryView` during configuration.

##### CustomEditorCell.swift
```swift
class CustomEditorCell: UICollectionViewCell 
{
    // cell reuse identifier
    static var reuseIdentifier: String {
        return String(describing: self) 
    }
    
    // nib of the cell's visual representation, 
    // if the cell was created only in the code, it is necessary to return nil
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}
```

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView() //StoryView initialization
    storyView.storiesDelegate = self // set delegate
    
    storyView.editorCell = CustomEditorCell
    
    view.addSubview(storyView) //adding an object to a view
    
    storyView.create() //running internal logic
}
```