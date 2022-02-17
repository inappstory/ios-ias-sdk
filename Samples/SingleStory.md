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
        
        // settings can also be specified at any time before creating a StoryListView or calling individual stories
        InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    }
    ...
}
```

In the view, where you want to show onboarding, set the `singleStory` extension method for `View`

##### ContentView.swift
```swift
struct ContentView: View
{
    // set isSinglePresent = true, if need show single story
    @State var isSinglePresent: Bool = false
    ...
    var body: some View {
        VStack(alignment: .leading) {
            Button("Show Single Story") {
                isSinglePresent = true
            }
            Spacer()
        }
        .padding(.top)
        .singleStory(storyID: <String>, isPresented: $isSinglePresent) // single story showing
    }
}
```

All parametrs review of onboarding see in [SingleStory](https://github.com/inappstory/ios-sdk/tree/SwiftUI#singlestory)