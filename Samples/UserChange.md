# User change

After creating and initializing the `StoryListView`, it may be necessary to replace the user in the application, for example, during registration or re-authorization.

The library provides for the uniqueness of an open session, depending on the settings that were passed to `InAppStory` and when the `Settings` object was changed.

To refresh the data, you need set binding parametr `refresh` to *true*, a new session will be opened and new content for the lists will be requested.

##### ChangeUserView.swift
```swift
...

@State var isStoryRefresh: Bool = false
        
var body: some View {
    VStack(alignment: .leading) {
        StoryListView(refresh: $isStoryRefresh)
        .frame(height: 150.0)
        Spacer()
    }
    .padding(.top)
}


func changeUser() {
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    isStoryRefresh = true
}
...
```