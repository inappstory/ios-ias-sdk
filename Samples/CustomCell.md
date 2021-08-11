# Cell customization

## Customization through properties

Customization through properties changes the appearance of a standard cell with a fixed rounding and border thickness. Sizes also apply to the favorites cell. To change the appearance, shape and behavior of a cell, you need to create your own cell. The cell should implement `StoryCellProtocol` and` FavoriteCellProtocol`, described in more detail [here](https://github.com/inappstory/ios-sdk/blob/main/Samples/CustomCell.md#Customization-via-StoryCellProtocol-and-FavoriteCellProtocol).

1) You need to initialize InAppStory in the project

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
     
    // settings can also be specified at any time before creating a StoryView or calling individual stories
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    return true
}
```

2) Customizing the appearance of a cell through parameters

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    ...
    
    // customization of appearance
    InAppStory.shared.showCellTitle = true //title display
    
    InAppStory.shared.cellBorderColor = .purple //border color around an unopened cell 
    
    InAppStory.shared.cellFont = UIFont.systemFont(ofSize: 12.0) //title font (you can specify your own by first connecting it to the project)
    
    InAppStory.shared.coverQuality = .high // quality of cover images
}
```

3) Should initialize `StoryView` in `ViewController`

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //StoryView initialization
    view.addSubview(storyView) //adding an object to a view
    
    storyView.create() //running internal logic
}
```
4) It is also necessary to add `StoryViewDelegateFlowLayout` and implement it

##### ViewController.swift
```swift 

...

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //StoryView initialization
    storyView.deleagateFlowLayout = self //defining a list display delegate
    
    view.addSubview(storyView) //adding an object to a view
    
    storyView.create() //running internal logic
}
...
// Implementing StoryViewDelegateFlowLayout Methods
func sizeForItem() -> CGSize
{
    return CGSize(width: 160.0, height: 160.0) //cell size
}

func insetForSection() -> UIEdgeInsets
{
    return UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0) //padding from the edges of the StoryView
}

func minimumLineSpacingForSection() -> CGFloat
{
    return 4.0 //vertical padding between cells
}

func minimumInteritemSpacingForSection() -> CGFloat
{
    return 4.0 //horizontal padding between cells
}

```

## Customization via `StoryCellProtocol` and `FavoriteCellProtocol`

1) You need to initialize InAppStory in the project

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // settings can also be specified at any time before creating a StoryView or calling individual stories
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    return true
}
```

2) Should initialize `StoryView` in `ViewController`

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //StoryView initialization
    view.addSubview(storyView) //adding an object to a view
    
    storyView.create() //running internal logic
}
```

3) It is also necessary to add `StoryViewDelegateFlowLayout` and implement it

##### ViewController.swift
```swift
...
override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //StoryView initialization
    storyView.deleagateFlowLayout = self //defining a list display delegate
    
    view.addSubview(storyView) //adding an object to a view
    
    storyView.create() //running internal logic
}
...
// implementing StoryViewDelegateFlowLayout methods 
func sizeForItem() -> CGSize
{
    return CGSize(width: 160.0, height: 160.0) //cell size
}

func insetForSection() -> UIEdgeInsets
{
    return UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0) //padding from the edges of the StoryView
}

func minimumLineSpacingForSection() -> CGFloat
{
    return 4.0 //vertical padding between cells
}

func minimumInteritemSpacingForSection() -> CGFloat
{
    return 4.0 //horizontal padding between cells
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
    
    func setSource(_ text: String) {
        // source title of cell (deprecated soon)
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


6) It is necessary to specify cell data for an instance of the `StoryView` class

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //StoryView initialization
    
    storyView.deleagateFlowLayout = self //defining a list display delegate
    
    storyView.storyCell = CustomStoryCell() //custom list cell
    storyView.favoriteCell = CustomFavoriteCell() //custom favorite cell
    
    view.addSubview(storyView) //adding an object to a view
    
    storyView.create() //running internal logic
}
```
