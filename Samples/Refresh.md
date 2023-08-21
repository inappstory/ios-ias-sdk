# Refresh

To refresh the list of stories, set binding parameter `refresh` to *true*, for example, if you need to implement the *"Pull to refresh"* functionality.

When `refresh` sets *true*, the data for the list corresponding to the current user session and the list of tags will be re-requested.
  
See also - [Change user](UserChange.md), [Change tags](Tags.md)

##### RefreshView.swift
```swift
struct UserChangeView: View
{
    @State var isStoryRefresh: Bool = false
        
    var body: some View {
        VStack(alignment: .leading) {
            StoryListView(refresh: $isStoryRefresh)
                .frame(height: 150.0)
            HStack {
                Spacer()
                Button("Refresh") {
                    isStoryRefresh = true
                }
                Spacer()
            }
            .padding()
            Spacer()
        }
        .padding(.top)
    }
}
```
