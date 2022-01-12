# Tags

1) Tags can be set when initializing the library with setting `userID`.

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
        // library settings object
        let settings = Settings(userID: <String>, tags: <Array<String>>)
        
        //library initialization
        InAppStory.shared.initWith(serviceKey: "<service_key>")
    }
    ...
}
```

2) Tags can be set with user settings after initializing the library through the `settings` parameter.

##### ContentView.swift
```swift
struct ContentView: View
{
    init() {
        //library initialization
        InAppStory.shared.initWith(serviceKey: "<service_key>")
        
        // settings can also be specified at any time before creating a StoryViewSUI or calling individual stories
        InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    }
    ...
}
```

3) Also, tags can be added or removed in portions after creating the `StoryView`. For the changes to take effect, you need to update the list (see [Refresh](Refresh.md))

> **Remark**  
> Onboarding can also be displayed depending on tags, but you don't need to call `refresh()` on the list to update them

##### ContentView.swift
```swift
...
var storyView: StoryViewSUI!

func setTags() {
    InAppStory.shared.setTags(<Array<String>>) //replace all tags list
    
    storyView.refresh() //updating story list
}

func addTags() {
    InAppStory.shared.addTags(<Array<String>>) //add tag list
    
    storyView.refresh() //updating story list
}

func removeTags() {
    InAppStory.shared.removeTags(<Array<String>>) //delete tag list
    
    storyView.refresh() //updating story list
}
```
