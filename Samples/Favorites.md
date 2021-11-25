# Favorites

To display the favorites screen, you should wait for the StoryView to call the `favoriteCellDidSelect()` delegate method. After that, go to the screen with your favorite stories.

##### ContentView.swift
```swift
struct ContentView: View
{
    @State private var isFavoriteSelected: Bool = false
        
    init() {
        //library initialization
        InAppStory.shared.initWith(serviceKey: "<service_key>")
        
        // settings can also be specified at any time before creating a StoryViewSUI or calling individual stories
        InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
        
        // enable favorite button in reader & showinng favorite cell in the end of list
        InAppStory.shared.favoritePanel = true
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // init StoryViewSUI with delegate FavoritesStoryViewDelegate
            StoryViewSUI(delegate: FavoritesStoryViewDelegate(isFavoriteSelected: $isFavoriteSelected))
                .create() //running internal logic
                .frame(height: 150.0)
            Spacer()
        }
        .padding(.top)
        .navigationBarTitle(Text("Favorites"))
        .sheet(isPresented: $isFavoriteSelected) { // present View if favorite cell is selected
            NavigationView {
                StoryViewSUI(isFavorite: true) // favorite StoryViewSUI View
                    .create() //running internal logic
                    .navigationBarTitle(Text("Favorites"), displayMode: .inline)
            }
        }
    }
}
```

The favorites screen is created in the same way as the list of stories. `StoryViewSUI` with the parameter `isFavorite = true`.

##### FavoritesStoryViewDelegate.swift

```swift
class FavoritesStoryViewDelegate: NSObject, InAppStoryDelegate
{
    @Binding var favoriteSelected: Bool // bindig var selected favorite cell
    
    init(isFavoriteSelected: Binding<Bool>) {
        self._favoriteSelected = isFavoriteSelected
        
        super.init()
    }
    
    func storiesDidUpdated(isContent: Bool, from storyType: StoriesType) 
    {
        //called when the data in the StoryViewSUI is updated
    }
    
    // called when a button or SwipeUp event is triggered in the reader
    func storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType) {
        if let url = URL(string: target) {
            UIApplication.shared.open(url)
        }
    }
    
    // called when favorite cell selected
    func favoriteCellDidSelect() {
        favoriteSelected = true // set binding var true value
    }
}
``` 