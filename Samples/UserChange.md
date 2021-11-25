# User change

After creating and initializing the `StoryViewSUI`, it may be necessary to replace the user in the application, for example, during registration or re-authorization.

The library provides for the uniqueness of an open session, depending on the settings that were passed to `InAppStory` and when the `Settings` object was changed.

To refresh the data, you need to call `refresh()`, a new session will be opened and new content for the lists will be requested.

##### ViewController.swift
```swift
...

func changeUser() {
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    storyView.refresh()
}
...
```