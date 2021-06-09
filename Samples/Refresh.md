# Refresh

To refresh the list of stories, call `refresh()` from `StoryView`, for example, if you need to implement the *"Pull to refresh"* functionality.

When calling `refresh()`, the data for the list corresponding to the current user session and the list of tags will be re-requested.
  
See also - [Change user] (UserChange.md), [Change tags] (Tags.md)

##### ViewController.swift
```swift
...

var storyView: StoryView!

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //initialize StoryView
    view.addSubview(storyView) //add object to the view
    
    storyView.create() //running internal logic
}

func refresh() {
    storyView.refresh() // refresh StoryView
}
...
```