# Sound control

Stories can contain videos for which the playback function with sound is enabled. For such cards, a sound switch button is displayed in the bottom panel. Audio playback is disabled by default

### Button customization

To change the sound button icons, you need to set the images in the `soundImage` and `soundSelectedImage` parameters at `InAppStory`

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    // library initialization
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // settings can also be specified at any time before creating a StoryView or calling individual stories 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    // Change sound button icons
    InAppStory.shared.soundImage = <UIImage> // Sound on
    InAppStory.shared.soundSelectedImage = <UIImage> // Sound off
    
    return true
}
```

### Control

By default, the sound in the story is turned off, this can be changed by setting the `InAppStory` parameter `muted` with the required value.

##### SoundView.swift
```swift
...

func changeSound(value: Bool) {
    InAppStory.shared.muted = value
}
...
```  

---
**Remark**  
If you specify `muted` while a story with sound is open, the sound will stop or start, depending on the value passed.
So you can control the sound from the application that has a built-in library.

---
