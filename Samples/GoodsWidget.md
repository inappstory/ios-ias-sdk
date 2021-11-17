# Goods widget

### Сontents

### Default GoodsWidget

For default integration *GoodsWidget* need:

1. setup widget in web console;
2. realize two methods from *InAppStoryDelegate*

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // settings can also be specified at any time before creating a StoryView or calling individual stories 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    return true
}
```

##### ViewController.swift
```swift
...
extension ViewController: InAppStoryDelegate
{
    //get goods object from parent app
	func getGoodsObject(with skus: Array<String>, complete: @escaping GoodsComplete)
    {
        // get goods info from your App
        ...
        
        var goodsArray: Array<GoodObject> = []
        
        for item in goodsInfos {
            let goodObject = GoodObject(sku: <String>, //item sku
                                        title: <String>?, //item title for cell
                                        subtitle: <String>?, //item subtitle for cell
                                        imageURL: <URL>?, //image url for cell
                                        price: <String>?, //price value for cell
                                        discount: <String>?) //discount value for cell
            goodsArray.append(goodObject)
        }
        
        complete(.success(goodsArray))
        
        //if the list could not be retrieved or a network error occurred while retrieving, 
        //you must call complete(.failure(.close or .refresh))
    }
    
    //item selection handler
    func goodItemSelected(_ item: Any, with storyType: StoriesType, storyView: StoryView?)
    {
        InAppStory.shared.closeReader {
            //event handling and product display in the application
        }
    }
}
```

### Customization

InAppStory has three ways to customize GoodsWidget:

* Customize default cell of goods [Appearance customization]();
* Set custom cell [Custom cell]();
* Fully custom widget implemented on the application side [Full owerride widget]()

#### Appearance customization

>-

Appearance customization is similar to the work of a list with stories.

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
2) Customizing the appearance of a cell and widget through parameters

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    ...
    
    // customization of appearance
    InAppStory.shared.goodsCellMainTextColor: UIColor     = .black //color of cell labels
    InAppStory.shared.goodsCellDiscountTextColor: UIColor = .red //color of discount label
    
    //fonts of cell's labels
    InAppStory.shared.goodCellTitleFont: UIFont    = UIFont.systemFont(ofSize: 14.0, weight: .medium)
    InAppStory.shared.goodCellSubtitleFont: UIFont = UIFont.systemFont(ofSize: 12.0)
    InAppStory.shared.goodCellPriceFont: UIFont    = UIFont.systemFont(ofSize: 14.0, weight: .medium)
    InAppStory.shared.goodCellDiscountFont: UIFont = UIFont.systemFont(ofSize: 14.0, weight: .medium)
    
    //background color of close button
    InAppStory.shared.goodsCloseBackgroundColor: UIColor  = .white
    //goods list background color
    InAppStory.shared.goodsSubstrateColor: UIColor        = .white
    
    //image for refresh button
    InAppStory.shared.refreshGoodsImage: UIImage = UIImage(named: "refreshIcon")!
    //image for close button
    InAppStory.shared.goodsCloseImage: UIImage   = UIImage(named: "goodsClose")!
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

4) It is also necessary to add `GoodsDelegateFlowLayout` and implement it

##### ViewController.swift
```swift 
...
override func viewDidLoad() {
    ...
    
    InAppStory.shared.goodsDelegateFlowLayout = self //defining a list display delegate
}

...
// Implementing GoodsDelegateFlowLayout Methods
func sizeForItem() -> CGSize
{
    return return CGSize(width: 158.0, height: 224.0) //cell size
}

func insetForSection() -> UIEdgeInsets
{
    return UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0) //padding from the edges of the StoryView
}

func minimumLineSpacingForSection() -> CGFloat
{
    return 8.0 //vertical padding between cells
}

```

#### Custom cell

>-

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

3) It is also necessary to add `GoodsDelegateFlowLayout` and implement it

##### ViewController.swift
```swift 
...
override func viewDidLoad() {
    ...
    
    InAppStory.shared.goodsDelegateFlowLayout = self //defining a list display delegate
}

...
// Implementing GoodsDelegateFlowLayout Methods
func sizeForItem() -> CGSize
{
    return return CGSize(width: 130.0, height: 130.0) //cell size
}

func insetForSection() -> UIEdgeInsets
{
    return UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0) //padding from the edges of the StoryView
}

func minimumLineSpacingForSection() -> CGFloat
{
    return 8.0 //vertical padding between cells
}

```

4) For the list cell, create a class that implements the `GoodsCellProtocol` protocol

##### CustomGoodsCell.swift
```swift
class CustomGoodsCell: UICollectionViewCell 
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

// implementation of the GoodsCellProtocol
extension CustomGoodsCell: GoodsCellProtocol
{
    func setGoodObject(_ object: Any!)
    {
        //this method accepts any object that the developer passed 
        //to the delegate method getGoodsObject(...)
        //from this object you can fill the contents of the cell
    }
}
```
> **Pay attention!**  
> The library does not have access to the custom cell, except for the implementation of the `GoodsCellProtocol ` protocol. To display the actual information and avoid duplicate thumbnails, it is necessary to clean the images and colors with each call of the `setGoodObject` methods.

6) It is necessary to specify cell data for an instance of the `InAppStory`

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    ...
    
    //set custom cell class
    InAppStory.shared.goodCell = CustomGoodsCell()
}
```

#### Full owerride widget

>-

The Goods Widget can be completely replaced with a custom implementation. It must be remembered that with such a change, the library does not have access to it and works with the widget only through the [CustomGoodsView](https://github.com/inappstory/ios-sdk#CustomGoodsView) methods.

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

2) Should create a class that inherits *CustomGoodsView*

##### ViewController.swift
```swift
class GoodsView: CustomGoodsView
{
    override func setSKUItems(_ items: Array<String>) 
    {
        super.setSKUItems(items)
        
        //setting the SKU list received from the library components
    }
     
    override func setReaderFrame(_ frame: CGRect) 
    {
        super.setReaderFrame(frame)
        
        //setting the size and position of the reader from which the widget was shown
    }
    
    func selectGoodsItem()
    {
        // send selected item SKU for statistics
        super.goodsItemClick(with: <String>)
    }
}
```

To close the widget, for example, when tapping in an empty space, you need to call `close()` on the *superclass*.

If you want to close the reader, for example, after a tap on one of the products, you can call `InAppStory.shared.closeReader()`. This method will close any open reader shown on the screen, as well as all its child screens.

3) It is necessary to specify custom view data for an instance of the `InAppStory`

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    ...
    
    //set custom goods view class
    InAppStory.shared.goodsView = GoodsView()
}
```

4) Implementing handling of your widget's actions

















