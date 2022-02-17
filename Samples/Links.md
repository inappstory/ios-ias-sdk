# Link Handing

Links can come  from stories when you click on a button or using the swipeUP action.  
Stories can also be a link and be triggered without opening the reader.

To get links, you need to specify a close for `StoryListView` and implement the method `onAction: ((_ target: String) -> Void)? = nil`, `target` is the text link.

For handling links from onboarding and single stories see [SingleStory](SingleStory.md) and [OnboardingStory](OnboardingStory.md)

1) To initialize InAppStory library in the project

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
        //library initialization
        InAppStory.shared.initWith(serviceKey: "<service_key>")
        
        // settings can also be specified at any time before creating a StoryListView or calling individual stories
        InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    }
    ...
}
```

2) Initialize `StoryListView ` in `ContentView `, and add a closure `onAction`

##### ContentView.swift
```swift
struct ContentView: View
{
    ...
    var body: some View {
        StoryListView(onAction: { target in // call when link come from story
            InAppStory.shared.closeReader {
                if let url = URL(string: target) {
                    UIApplication.shared.open(url)
                }
            }
        }, refresh: $isStoryRefresh)
            .frame(height: 150.0)
    }
}
```