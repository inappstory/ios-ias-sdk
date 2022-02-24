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