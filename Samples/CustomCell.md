# Cell customization

## Customization through properties

Customization through properties changes the appearance of a standard cell with a fixed rounding and border thickness. Sizes also apply to the favorites cell. To change the appearance, shape and behavior of a cell, you need to create your own cell. The cell should implement `StoryCellProtocol` and` FavoriteCellProtocol`, described in more detail [here](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/CustomCell.md#Customization-via-StoryCellProtocol-and-FavoriteCellProtocol).


1) You need to initialize InAppStory in the project

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

2) Customizing the appearance of a cell through parameters

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
        // quality of cover images in cells
        InAppStory.shared.coverQuality = .high
        
        // show title in cell
        InAppStory.shared.showCellTitle = true
    
        // color of cell border
        InAppStory.shared.cellBorderColor = .purple
        // cell's border radius
        // to create a circle, you need to specify half the cell size.
        // at this sample - is 75.0
        InAppStory.shared.cellBorderRadius = 16.0 // default value
        // cell title font
        InAppStory.shared.cellFont = UIFont.systemFont(ofSize: 12.0)
    }
    ...
}
```

3) Should create `StoryListView` in `ContentView`

##### ContentView.swift
```swift
struct ContentView: View
{
    ...
    var body: some View {
        StoryListView(onAction: { target in // get link from story
            InAppStory.shared.closeReader {
                if let url = URL(string: target) {
                    UIApplication.shared.open(url)
                }
            }
        }, refresh: $isStoryRefresh) // refresh stories list
            .itemsSize(CGSize(width: 150.0, height: 150.0))//cell size
            .edgeInserts(UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)) //padding from the edges of the StoryListView
            .lineSpacing(8.0) //vertical padding between cells
            .interitemSpacing(8.0) //horizontal padding between cells
            .frame(height: 150.0)
    }
}
```

## Customization via `StoryCellProtocol` and `FavoriteCellProtocol`

1) You need to initialize InAppStory in the project

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

2) Should initialize `StoryListView` in `ContentView`

##### ContentView.swift
```swift
struct ContentView: View
{
    ...
    var body: some View {
        StoryListView(onAction: { target in // get link from story
            InAppStory.shared.closeReader {
                if let url = URL(string: target) {
                    UIApplication.shared.open(url)
                }
            }
        }, refresh: $isStoryRefresh) // refresh stories list
            .itemsSize(CGSize(width: 150.0, height: 150.0))//cell size
            .edgeInserts(UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)) //padding from the edges of the StoryListView
            .lineSpacing(8.0) //vertical padding between cells
            .interitemSpacing(8.0) //horizontal padding between cells
            .frame(height: 150.0)
    }
}
```
4) For the list cell, create a class that implements the `StoryCellProtocol` protocol

##### CustomStoryCell.swift
```swift
class CustomStoryCell: UICollectionViewCell 
{
    // cell reuse identifier
    static var reuseIdentifier: String {
        return String(describing: self) 
    }
    
    // nib of the cell's visual representation, 
    // if the cell was created only in the code, it is necessary to return nil
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// implementation of the StoryCellProtocol
extension CustomStoryCell: StoryCellProtocol
{
    func setTitle(_ text: String) {
        // title of cell
    }
    
    func setImageURL(_ url: URL) {
        // image url for cover
    }
    
    func setVideoURL(_ url: URL) {
        // video url for animated cover
    }
    
    func setOpened(_ value: Bool) {
        // set new state if story is opened
    }
    
    func setHighlight(_ value: Bool) {
        // set new state if story cell if highlighted
    }
    
    func setBackgroundColor(_ color: UIColor) {
        // set background color of cell
    }
    
    func setTitleColor(_ color: UIColor) {
        // set title color of cell
    }
    
    func setSound(_ value: Bool) {
        // does the story have sound
    }
}
```

5) If the favorite functionality is enabled in the application, create a class that implements the `FavoriteCellProtocol` protocol

##### CustomFavoriteCell.swift
```swift
class CustomFavoriteCell: UICollectionViewCell
{
    // cell reuse identifier
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // nib of the cell's visual representation, 
    // if the cell was created only in the code, it is necessary to return nil
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// implementation of the FavoriteCellProtocol
extension StoryFavoriteCell: FavoriteCellProtocol
{
    func setImages(_ urls: Array<URL?>) {
        // a list of addresses of the first four images stories in favorites
    }
    
    func setImagesColors(_ colors: Array<UIColor?>) {
        // a list of background colors of the first four stories in favorites
    }
    
    func setHighlight(_ value: Bool) {
        // set new state if story cell if highlighted
    }
    
    func setBackgroundColor(_ color: UIColor) {
        // main background color of a cell
    }
}
```

> **Pay attention!**  
> The library does not have access to the custom cell, except for the implementation of the `FavoriteCellProtocol` protocol. To display the actual information and avoid duplicate thumbnails, it is necessary to clean the images and colors with each call of the `setImages` and `setImagesColors` methods.


6) It is necessary to specify cell data for an instance of the `StoryListView` class

##### ContentView.swift
```swift
struct ContentView: View
{
    ...
    var body: some View {
        StoryListView(onAction: { target in // get link from story
            InAppStory.shared.closeReader {
                if let url = URL(string: target) {
                    UIApplication.shared.open(url)
                }
            }
        }, refresh: $isStoryRefresh) // refresh stories list
        //---- add custom cells for list
            .setStoryCell(customCell: CustomStoryCell()) //custom list cell
            .setFavoriteCell(customCell: CustomFavoriteCell()) //custom favorite cell
        //----
            .itemsSize(CGSize(width: 150.0, height: 150.0))
            .edgeInserts(UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0))
            .lineSpacing(8.0)
            .interitemSpacing(8.0)            
            .frame(height: 150.0)
    }
}
```
