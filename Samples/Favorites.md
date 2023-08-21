# Favorites

To display the favorites screen, you should wait for the StoryView to call the `favoriteCellDidSelect()` delegate method. After that, go to the screen with your favorite stories.

##### ContentView.swift
```swift
struct ContentView: View
{
    @State var isFavoriteSelected: Bool = false // is favorite cell selected in list
    @State var isStoryRefresh: Bool = false // is story list need refresh
    @State var isFavoriteRefresh: Bool = false // is favorites list need refresh
        
    init() {
        //library initialization
        InAppStory.shared.initWith(serviceKey: "<service_key>")
        
        // settings can also be specified at any time before creating a StoryListView or calling individual stories
        InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
        
        // enable favorite button in reader & showinng favorite cell in the end of list
        InAppStory.shared.favoritePanel = true
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            StoryListView(onAction: { target, type in
                InAppStory.shared.closeReader {
                    if let url = URL(string: target) {
                        UIApplication.shared.open(url)
                    }
                }
            }, favoritesSelect: {
                isFavoriteSelected = true
            }, refresh: $isStoryRefresh)
                .frame(height: 150.0)
            Spacer()
        }
        .padding(.top)
        .navigationBarTitle(Text("Favorites"))
        .sheet(isPresented: $isFavoriteSelected) { // present View if favorite cell is selected
            NavigationView {
                StoryListView(isFavorite: true, refresh: $isFavoriteRefresh) // favorites stories list view
                    .navigationBarTitle(Text("Favorites"), displayMode: .inline)
            }
        }
    }
}
```

The favorites screen is created in the same way as the list of stories. `StoryListView` with the parameter `isFavorite = true`.


## Removing favorites by ID

`InAppStory.shared.removeFromFavorite(with storyID: <String>)`  


To remove a specific story from favorites, you need to call the `removeFromFavorite(with storyID: <String>)` method and specify the ID required for removal. You can get the story ID from the `StoryCellProtocol` cell in the `var storyID: String property! { get set }`. The request to delete stories is sent immediately after the method call and cannot be cancelled. To use the undo deletion function, you must first collect the ID of the story to be deleted and call the delete method for each through a loop.

## Removing all favorites
`InAppStory.shared.removeAllFavorites()`

To remove all favorite stories, call the `removeAllFavorites()`. This method also has no undo functionality.
