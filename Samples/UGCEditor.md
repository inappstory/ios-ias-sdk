# UGC Editor

Starting from version 1.16.0 you can add a light editor to the project.  
Before including the editor in the SDK, you need to enable this function in the web console project settings.

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

2) To enable the editor feature in the SDK, you need set the `isEditorEnabled` property to true

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    ...
    // enable editor functionality
    InAppStory.shared.isEditorEnabled = true
    ...
}
```

3) Initialize `StoryView` in `ViewController` and set delegate for them

##### MainView.swift
```swift
...
@State private var isEditorShowing: Bool = false
...
var body: some View {
    VStack(alignment: .leading) {
        StoryListView(
            onAction: { target, actionType in
                InAppStory.shared.closeReader {
                    if let url = URL(string: target) {
                        UIApplication.shared.open(url)
                    }
                }
            }, editorSelect: {
                // calling after editor cell tapped
                isEditorShowing.toggle()
            })
            .frame(height: 150.0)
        Spacer()
    }
    .padding(.top)
    // showing editor by state var isEditorShowing
    // get when editor is dismissed
    .storyEditor(isPresented: $isEditorShowing, onDismiss: { 
	     print(isEditorShowing)
    })
}
...
```
> **Remark**  
> Closing the editor does not happen instantly, before closing it, internal logic is triggered before closing.

## Editor list cell customize

Cell customization, at the moment, implies a complete replacement with a custom one. To do this, you need to create a *UICollectionViewCell* cell that implements the `EditorCellProtocol` protocol and pass it to `StoryListView` during configuration.

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

##### MainView.swift
```swift
...
@State private var isEditorShowing: Bool = false
...
var body: some View {
    VStack(alignment: .leading) {
        StoryListView(
            onAction: { target, actionType in
                InAppStory.shared.closeReader {
                    if let url = URL(string: target) {
                        UIApplication.shared.open(url)
                    }
                }
            }, editorSelect: {
                // calling after editor cell tapped
                isEditorShowing.toggle()
            })
            .setEditorCell(customCell: CustomEditorCell())
            .frame(height: 150.0)
        Spacer()
    }
    .padding(.top)
    // showing editor by state var isEditorShowing
    // get when editor is dismissed
    .storyEditor(isPresented: $isEditorShowing, onDismiss: { 
	     print(isEditorShowing)
    })
}
...
```