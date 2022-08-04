# Favorites

To display the favorites screen, you should wait for the StoryView to call the `favoriteCellDidSelect()` delegate method. After that, go to the screen with your favorite stories.

The favorites is common to all feeds. Adding story to favorites in one feed will cause it to appear in favorites in all feeds.

##### ViewController.swift
```swift
...

var storyView: StoryView!

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //initialize StoryView
    storyView.storiesDelegate = self //set InAppStoryDelegate delegate
    
    view.addSubview(storyView) //add object to the view
    
    storyView.create() //running internal logic
}

// MARK: - StoryViewDelegate
// triggered when clicking on the favorites cell
func favoriteCellDidSelect()
{
    // example of displaying the favorites list screen
    // the favorites screen is displayed by the developer, and can be displayed in any way
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let favoritesController = storyBoard.instantiateViewController(withIdentifier: "FavoritesController")
    self.show(favoritesController, sender: self)
}
...
```

The favorites screen is created in the same way as the list of stories. `StoryView` with the parameter `favorite = true`.

##### FavoritesController.swift

```swift
class FavoritesController: UIViewController {

    var favoritesView: StoryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoritesView = StoryView(frame: CGRect(x: 0.0, y: 100, width: 320, height: 160.0), favorite: true) //initialize StoryView
        favoritesView.target = self //reader display controller
        favoritesView.delegate = self //set StoryView delegate
        
        view.addSubview(favoritesView) //add object to the view
                
        favoritesView.create() //running internal logic
    }
}

extension FavoritesController: InAppStoryDelegate
{
    func storiesDidUpdated(isContent: Bool, from storyType: StoriesType) {
        //called when the data in the StoryView is updated
    }
    
    // called when a button or SwipeUp event is triggered in the reader
    func storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType) {
       if type == .swipe { // link obtained by swipeUP action
           if let url = URL(string: target) {
               let swipeContentController = SwipeContentController()
               // passing link to controller from WebView
               swipeContentController.linkURL = url
               
               if storyType == .list {
	               // opening the controller over of the reader
	               storyView.present(controller: swipeContentController)
               }
           }
       } else { // .button, .game, .deeplink
            // if the processed link leads to a screen in the application, 
            // recommend to close the reader
            if let storyView = storyView {
	            storyView.closeReader {
	                // processing a link, for example, to follow it in safari
	                if let url = URL(string: target) {
	                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
	                }
	            }
            } else {
                InAppStory.shared.closeReader {
                    // processing a link, for example, to follow it in safari
	                if let url = URL(string: target) {
	                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
	                }
                }
            }
        }
    }
    
    func storyReaderWillShow(with storyType: StoriesType) {
        // called before the reader will show
    }
    
    func storyReaderDidClose(with storyType: StoriesType) {
        // called after closing the story reader
    }
}
``` 

## Removing favorites by ID

`InAppStory.shared.removeFromFavorite(with storyID: <String>)`  


To remove a specific story from favorites, you need to call the `removeFromFavorite(with storyID: <String>)` method and specify the ID required for removal. You can get the story ID from the `StoryCellProtocol` cell in the `var storyID: String property! { get set }`. The request to delete stories is sent immediately after the method call and cannot be cancelled. To use the undo deletion function, you must first collect the ID of the story to be deleted and call the delete method for each through a loop.

## Removing all favorites
`InAppStory.shared.removeAllFavorites()`

To remove all favorite stories, call the `removeAllFavorites()`. This method also has no undo functionality.
