# Refresh

To refresh the list of stories, call `refresh()` from `StoryView`, for example, if you need to implement the *"Pull to refresh"* functionality.

When calling `refresh()`, the data for the list corresponding to the current user session and the list of tags will be re-requested.
  
See also - [Change user](UserChange.md), [Change tags](Tags.md)

##### ViewController.swift
```swift
struct UserChangeView: View
{
    // local var of storyView
    private var storyView: StoryViewSUI = StoryViewSUI()
        
    var body: some View {
        VStack(alignment: .leading) {
            storyView
                .create()
                .frame(height: 150.0)
            HStack {
                Spacer()
                Button("Refresh") {
                    _ = storyView.refresh() //call refresh metod from local var
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
