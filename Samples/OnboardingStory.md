# Onboarding Stories

This type of stories is a separate list that is configured in the console. It can be used to display welcome screens, advertisements, etc.

To display onboarding, you need to initialize InAppStory library in the project

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

In the controller, where you want to show onboarding, call the `showOnboardings` method of the `InAppStory`

##### ContentView.swift
```swift
struct ContentView: View
{
    var body: some View {
        VStack(alignment: .leading) {
            StoryViewSUI()
                .create()
                .frame(height: 150.0)
            Spacer()
        }
        .padding(.top)
        .navigationBarTitle(Text("Onboarding"))
        .onAppear() {
            InAppStory.shared.showOnboardings(delegate: OnboardingViewDelegate()) {}
        }
    }
}
```

To track the actions of the onboarding reader, you need to implement the `InAppStoryDelegate` methods

##### OnboardingViewDelegate.swift
```swift 
class OnboardingViewDelegate: NSObject, InAppStoryDelegate
{
    func storiesDidUpdated(isContent: Bool, from storyType: StoriesType) {}
    
    func storyReader(actionWith target: String, for type: ActionType, from storyType: StoriesType) {
        if let url = URL(string: target) {
            UIApplication.shared.open(url)
        }
    }
}
```