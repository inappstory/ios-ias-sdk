# Multi-Feed

In SDK version 1.15.0 added multi-feed functional.  
This functionality allows you to split list views into multiple feeds without using tags.

## Default

By default, the list shows a feed created in the console called "Feed", to display it there is no need to specify `feedID: <String>` when initializing the list.

##### ViewController.swift
```swift
...

var storyView: StoryView!

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView() //initialize StoryView with default feed
    storyView.target = self //set target for showing Reader
    
    view.addSubview(storyView) //add object to the view
    
    storyView.create() //running internal logic
}
```

## Custom feed

Before you can set feeds in an app, you need to create it in the console.

To set a separate feed in the list, you need to specify `feedID: <String>` when initializing the *StoryView*

##### ViewController.swift
```swift
...

var storyView: StoryView!

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(feedID: "CustomFeed") //initialize StoryView with custom feed id
    storyView.target = self //set target for showing Reader
    
    view.addSubview(storyView) //add object to the view
    
    storyView.create() //running internal logic
}
```

## Several feeds

You can optionally add multiple feeds to one or more controllers. This requires initializing multiple StoryView instances with different `feedID: <String>`. Also, you can leave one list with an empty `feedID: <String>`, and specify the necessary ones in the next one.

##### MainController.swift
```swift
...

var mainStoryView: StoryView!

// main controller with default stories feed
override func viewDidLoad() {
    super.viewDidLoad()
        
    mainStoryView = StoryView() //initialize StoryView with default feed
    mainStoryView.target = self //set target for showing Reader
    
    view.addSubview(mainStoryView) //add object to the view
    
    mainStoryView() //running internal logic
}
```

##### AboutController.swift
```swift
...

var aboutStoryView: StoryView!

// controller with stories from feed with id "AboutFeed"
override func viewDidLoad() {
    super.viewDidLoad()
        
    aboutStoryView = StoryView(feedID: "AboutFeed") //initialize StoryView with feed for "About" screen
    aboutStoryView.target = self //set target for showing Reader
    
    view.addSubview(aboutStoryView) //add object to the view
    
    aboutStoryView() //running internal logic
}
```

## Feeds in Onboardings

Various feeds can also be used in onboarding. See more in [OnboardingStory](OnboardingStory.md)