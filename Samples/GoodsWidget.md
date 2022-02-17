# Goods widget

### Сontents

### Default GoodsWidget

For default integration *GoodsWidget* need:

1. setup widget in web console;

##### ContentView.swift
```swift
struct ContentView: View
{
    @State var isAlertShowing: Bool = false
    @State var isStoryRefresh: Bool = false
    
    @State var selectedItemSKU: String = ""
        
    init() {
        //library initialization
        InAppStory.shared.initWith(serviceKey: "<service_key>")
        
        // settings can also be specified at any time before creating a StoryListView or calling individual stories
        InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    }

       
    var body: some View {
        VStack(alignment: .leading) {
            StoryListView(onAction: { target in
                InAppStory.shared.closeReader {
                    if let url = URL(string: target) {
                        UIApplication.shared.open(url)
                    }
                }
              }, getGoodsObjects: { skus, complete in
                complete(.success(getObjects(skus: skus))) // send list of goods objects to lib
              }, selectGoodsItem: { item in // get action, by selected goods item
                  InAppStory.shared.closeReader {
                      selectedItemSKU = item.sku as String
                      isAlertShowing = true
                  }
              }, refresh: $isStoryRefresh)
                .frame(height: 150.0)
            Spacer()
        }
        .padding(.top)
        .navigationBarTitle(Text("Simple GoodsWidget"))
        .alert(isPresented: $isAlertShowing) {
            Alert(
                title: Text("Select goods item"),
                message: Text("Goods item has SKU: \(selectedItemSKU)"),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
}

extension ContentView
{
    // Create list of goods objects by SKU's array
    fileprivate func getObjects(skus: Array<String>) -> Array<GoodsObjectProtocol>
    {
        var items: Array<GoodsObjectProtocol> = []
        for sku in skus {
            items.append(GoodObject(sku: sku,
                                    title: sku,
                                    subtitle: sku,
                                    imageURL: nil,
                                    price: nil,
                                    discount: nil))
        }
        
        return items
    }
}
```

### Customization

InAppStory has three ways to customize GoodsWidget:

* Customize default cell of goods [Appearance customization](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/GoodsWidget.md#appearance-customization);
* Set custom cell [Custom cell](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/GoodsWidget.md#custom-cell);
* Fully custom widget implemented on the application side [Full owerride widget](https://github.com/inappstory/ios-sdk/blob/SwiftUI/Samples/GoodsWidget.md#full-owerride-widget)

### Appearance customization

Appearance customization is similar to the work of a list with stories.

1) You need to initialize `InAppStorySUI` in the project

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

2) Customizing the appearance of a cell and widget through parameters

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
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
}
```

3) Should initialize `StoryListView` in `ContentView`

##### ContentView.swift
```swift
struct ContentView: View
{
    ...
    var body: some View {
        StoryListView(onAction: { target in
            InAppStory.shared.closeReader {
                if let url = URL(string: target) {
                    UIApplication.shared.open(url)
                }
            }
        }, getGoodsObjects: { skus, complete in
            complete(.success(getObjects(skus: skus))) // send list of goods objects to lib
        }, selectGoodsItem: { item in // get action, by selected goods item
            InAppStory.shared.closeReader {
                selectedItemSKU = item.sku as String
                isAlertShowing = true
            }
        }, refresh: $isStoryRefresh)
            .frame(height: 150.0)
    }
}
```

4) It is also necessary to add `GoodsDelegateFlowLayout` and implement it

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
        ...
    
        InAppStory.shared.goodsDelegateFlowLayout = CustomCellGoodsFlowDelegate.shared //defining a list display delegate
    }
}
```

##### CustomCellGoodsFlowDelegate.swift
```swift 
class CustomCellGoodsFlowDelegate: NSObject, GoodsDelegateFlowLayout
{
    static let shared: CustomCellGoodsFlowDelegate = .init()
    
    func sizeForItem() -> CGSize
    {
        return CGSize(width: 130.0, height: 130.0) //cell size
    }
    
    func insetForSection() -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0) //padding from the edges of the StoryView
    }
    
    func minimumLineSpacingForSection() -> CGFloat
    {
        return 8.0 //vertical padding between cells
    }
}

```

### Custom cell

1) You need to initialize `InAppStorySUI` in the project

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
        StoryListView(onAction: { target in
            InAppStory.shared.closeReader {
                if let url = URL(string: target) {
                    UIApplication.shared.open(url)
                }
            }
        }, getGoodsObjects: { skus, complete in
            complete(.success(getObjects(skus: skus))) // send list of goods objects to lib
        }, selectGoodsItem: { item in // get action, by selected goods item
            InAppStory.shared.closeReader {
                selectedItemSKU = item.sku as String
                isAlertShowing = true
            }
        }, refresh: $isStoryRefresh)
            .frame(height: 150.0)
    }
}
```

3) It is also necessary to add `GoodsDelegateFlowLayout` and implement it

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
        ...
    
        InAppStory.shared.goodsDelegateFlowLayout = self //defining a list display delegate
    }
}
```

##### CustomCellGoodsFlowDelegate.swift
```swift 
class CustomCellGoodsFlowDelegate: NSObject, GoodsDelegateFlowLayout
{
    func sizeForItem() -> CGSize
    {
        return CGSize(width: 130.0, height: 130.0) //cell size
    }
    
    func insetForSection() -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0) //padding from the edges of the StoryView
    }
    
    func minimumLineSpacingForSection() -> CGFloat
    {
        return 8.0 //vertical padding between cells
    }
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

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
        ...
    
        //set custom cell class
        InAppStory.shared.goodCell = CustomGoodsCell()
    }
}
```

### Full owerride widget

The Goods Widget can be completely replaced with a custom implementation. It must be remembered that with such a change, the library does not have access to it and works with the widget only through the [CustomGoodsView](https://github.com/inappstory/ios-sdk#CustomGoodsView) methods.

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

2) Should create a class that inherits *CustomGoodsView*

##### GoodsView.swift
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

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
        ...
    
        //set custom goods view class
        InAppStory.shared.goodsView = GoodsView()
    }
}
```

4) Implementing handling of your widget's actions

















