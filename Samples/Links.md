# Link Handing

Links can come  from stories when you click on a button or using the swipeUP action.  
Stories can also be a link and be triggered without opening the reader.

To get links, you need to specify a delegate for `StoryView` and implement the method `storyReader(actionWith target: <String>, for type: <ActionType>, from storyType: <StoriesType>)`, `type` is the way to open the link, and `target` is the text link.

For handling links from onboarding and single stories see [SingleStory](SingleStory.md) and [OnboardingStory](OnboardingStory.md)

1) To initialize InAppStory library in the project

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

2) Initialize `StoryViewSUI` in `ContentView `

##### ContentView.swift
```swift
struct ContentView: View
{
    ...
    var body: some View {
        StoryViewSUI(deleagate: StoryViewDelegate())
            .create()
            .frame(height: 150.0)
    }
}
```

3) To implement a delegate method for getting link

##### StoryViewDelegate.swift

```swift
class StoryViewDelegate: NSObject, InAppStoryDelegate
{
    ...
    
    // called when a button or SwipeUp event is triggered in the reader
    func storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType) {
        if let url = URL(string: target) {
            UIApplication.shared.open(url)
        }
    }
}
```