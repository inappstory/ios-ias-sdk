# List placeholder (skeleton)

In some applications, when loading the interface, developers display the loader as a grid of primitive elements or display a spinner. After loading certain data, this loader must be removed. 

To track the loading of data in the **StoryListView**, use the `onUpdated onUpdated: { isContent in
}` closure. This closure is called every time the data inside the stories list is updated.

##### PreloaderView.swift
```swift
struct PreloaderView: View
{
    @State var isStoriesContent: Bool = false
    
    init() {
        // setup InAppStorySDK for user with ID
        InAppStory.shared.settings = .init(userID: "")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                StoryListView(
                    onUpdated: { isContent in // called when content was updated
                        isStoriesConntent = isContent
                    })
                    .frame(height: 150.0)
                if !isStoriesConntent { // is StoryListView has content, loading text not showing
                    // Text view created over StoryListView without content
                    Text("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: 150.0)
                        .background(Color.white)
                }
            }
            Spacer()
        }
        .padding(.top)
        .navigationBarTitle(Text("Simple integration"))
    }
}
```

You can use different methods and approaches to display loading. For smooth operation, it is necessary to display the placeholder on top of the **StoryListView** in advance and track the change in the state of the content.

Also, when creating a **StoryListView**, you can set the height of the element to 0 and, if the content is successfully updated (`isContent = true`), set the height required by design.

For a placeholder in the form of a "*skeleton*" when updating the content, you can set the `hidden = isContent` parameter.
