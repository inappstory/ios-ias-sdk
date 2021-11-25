# SingleStory

This type of story is opened by the specified `id` or `slug`. It can be used open from a push notification or be tied to an entity in an app (like a poll or trailer).

To display single story, you need to initialize InAppStory library in the project.

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
        //library initialization
        InAppStory.shared.initWith(serviceKey: "<service_key>")
        
        // settings can also be specified at any time before creating a StoryViewSUI or calling individual stories
        InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    }
    ...
}
```

In the controller, where it is necessary to show a single story, call the `showSingleStory` method on `InAppStory`.

##### ContentView.swift
```swift
struct ContentView: View
{
    var body: some View {
        VStack(alignment: .leading) {
            Button("Show Single Story") {
                InAppStory.shared.showSingle(with: <String>, delegate: SingleViewDelegate()) {}
            }
            Spacer()
        }
        .padding(.top)
    }
}
```

To track the actions of the single story reader, you need to implement the `InAppStoryDelegate ` methods

##### SingleViewDelegate.swift

```swift 
class SingleViewDelegate: NSObject, InAppStoryDelegate
{
    func storiesDidUpdated(isContent: Bool, from storyType: StoriesType) {}
    
    func storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType) {
        if let url = URL(string: target) {
            UIApplication.shared.open(url)
        }
    }
}

```