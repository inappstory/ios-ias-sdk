# List placeholder (skeleton)

In some applications, when loading the interface, developers display the loader as a grid of primitive elements or display a spinner. After loading certain data, this loader must be removed. 

To track the loading of data in the StoryView, use the `InAppStoryDelegate.storiesDidUpdated(...)` delegate method. This method is called every time the data inside the stories list is updated.

1) First you need to set the project settings for **InAppStory**

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
2) Setting up the StoryView, assigning a delegate, and running the data retrieval logic

##### PreloaderController.swift
```swift
class PreloaderController: UIViewController {
...
    // setup StoryView
    fileprivate func setupStoryView()
    {
        // create instance of StoryView
        storyView = StoryView()
        storyView.translatesAutoresizingMaskIntoConstraints = false
        // adding a point from where the reader will be shown
        storyView.target = self
        // set StoryView delegate
        storyView.storiesDelegate = self
        
        self.view.addSubview(storyView)
        
        // running internal StoryView logic
        storyView.create()
    }
}
```
3) Creating a placeholder that is set on top of the StoryView while the data is being loaded from the server

##### PreloaderController.swift
```swift
...
fileprivate func setupPreloader()
{
    // create preloader activity indicator
    loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.style = UIActivityIndicatorView.Style.large
    loadingIndicator.startAnimating()
    self.view.addSubview(loadingIndicator)
    ... // setup position centered on storyView
}
```
4) Implement the **InAppStoryDelegate** method to track the update of data in the list

##### PreloaderController.swift
```swift
extension PreloaderController: InAppStoryDelegate
{
    // delegate method, called when the data is updated
    func storiesDidUpdated(isContent: Bool, from storyType: StoriesType)
    {
        guard let currentStoryView = storyView else {
            return
        }
        
        if isContent { // StoryView has content
            loadingIndicator.stopAnimating() // stop animating and hide preloader
        } else { // StoryView has't content
            loadingIndicator.stopAnimating() // stop animating and hide preloader
            currentStoryView.isHidden = true // hide storyView withot content
        }
    }
}
```

You can use different methods and approaches to display loading. For smooth operation, it is necessary to display the placeholder on top of the **StoryView** in advance and track the change in the state of the content.

Also, when creating a **StoryView**, you can set the height of the element to 0 and, if the content is successfully updated (`isContent = true`), set the height required by design.

For a placeholder in the form of a "*skeleton*" when updating the content, you can set the `hidden = isContent` parameter.