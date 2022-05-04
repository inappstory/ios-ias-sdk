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
        
        // settings can also be specified at any time before creating a StoryListView or calling individual stories
        InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    }
    ...
}
```

### Default Onboardings

In the view, where you want to show onboarding, set the `onboardingStories` extension method for `View`.  
By default (if `feed: <String>` is not specified), the feed marked in the console as "Onboarding" will be displayed.

##### ContentView.swift
```swift
struct ContentView: View
{
	// set isOnboardingPresent = true, if need show onboardings
    @State var isOnboardingPresent: Bool = false
    ...
    var body: some View {
        VStack(alignment: .leading) {
            // main body content of view
        }
        .padding(.top)
        .navigationBarTitle(Text("Onboarding"))
        .onboardingStories(isPresented: $isOnboardingPresent) // onboardings showing
    }
}
```
### Custom tags Onboardings

For onboarding, you can set a list of tags other than those set in `InAppStory.shared.settings`. Tags set in this way completely override the tags set in `InAppStory.shared.settings` for a particular onboarding call.

##### ContentView.swift
```swift
struct ContentView: View
{
	// set isOnboardingPresent = true, if need show onboardings
    @State var isOnboardingPresent: Bool = false
    ...
    var body: some View {
        VStack(alignment: .leading) {
            // main body content of view
        }
        .padding(.top)
        .navigationBarTitle(Text("Onboarding"))
        .onboardingStories(feed: "OnboardingFeed", // custom onboarding feed
                           tags: ["Array of custom tags"], // custom tags for onboardinng
                           isPresented: $isOnboardingPresent) // onboardings showing
    }
}
```

### Custom feed Onboardings

In onboarding, you can show any feed from the list in the console. To show a non-default feed, you must specify `feed: <String>` when calling the `onboardingStories` method of the extension method for `View`.

##### ContentView.swift
```swift
struct ContentView: View
{
	// set isOnboardingPresent = true, if need show onboardings
    @State var isOnboardingPresent: Bool = false
    ...
    var body: some View {
        VStack(alignment: .leading) {
            // main body content of view
        }
        .padding(.top)
        .navigationBarTitle(Text("Onboarding"))
        .onboardingStories(feed: "OnboardingFeed", // custom onboarding feed
                           isPresented: $isOnboardingPresent) // onboardings showing
    }
}
```
> **Pay attention**  
> Displaying any feed in onboarding works according to onboarding rules. Stories are shown only once per user. The next time you try to show the read story in onboarding, it will be cut off.


All parametrs review of onboarding see in [OnboardingStory](https://github.com/inappstory/ios-sdk/tree/SwiftUI#onboardingstory)