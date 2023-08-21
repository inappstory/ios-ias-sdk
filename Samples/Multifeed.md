# Multi-Feed

In SDK version 1.15.0 added multi-feed functional.  
This functionality allows you to split list views into multiple feeds without using tags.

## Default

By default, the list shows a feed created in the console called "Feed", to display it there is no need to specify `feed: <String>` when initializing the list.

##### MainView.swift
```swift
...
var body: some View {
    VStack(alignment: .leading) {
        StoryListView(
            onAction: { target, actionType in
                InAppStory.shared.closeReader {
                    if let url = URL(string: target) {
                        UIApplication.shared.open(url)
                    }
                }
            })
            .frame(height: 150.0)
        Spacer()
    }
    .padding(.top)
    .navigationBarTitle(Text("Simple integration"))
}
...
```

## Custom feed

Before you can set feeds in an app, you need to create it in the console.

To set a separate feed in the list, you need to specify `feed: <String>` when initializing the **StoryListView**

##### MainView.swift
```swift
...
var body: some View {
    VStack(alignment: .leading) {
        StoryListView(
            feed: "CustomFeed",
            onAction: { target, actionType in
                InAppStory.shared.closeReader {
                    if let url = URL(string: target) {
                        UIApplication.shared.open(url)
                    }
                }
            })
            .frame(height: 150.0)
        Spacer()
    }
    .padding(.top)
    .navigationBarTitle(Text("Simple integration"))
}
...
```

## Several feeds

You can optionally add multiple feeds to one or more controllers. This requires initializing multiple **StoryListView** instances with different `feed: <String>`. Also, you can leave one list with an empty `feed: <String>`, and specify the necessary ones in the next one.

##### MainView.swift
```swift
...
var body: some View {
    VStack(alignment: .leading) {
        StoryListView(
            onAction: { target, actionType in
                InAppStory.shared.closeReader {
                    if let url = URL(string: target) {
                        UIApplication.shared.open(url)
                    }
                }
            })
            .frame(height: 150.0)
        Spacer()
    }
    .padding(.top)
    .navigationBarTitle(Text("Simple integration"))
}
...
```

##### AboutView.swift
```swift
...
var body: some View {
    VStack(alignment: .leading) {
        StoryListView(
            feed: "AboutFeed",
            onAction: { target, actionType in
                InAppStory.shared.closeReader {
                    if let url = URL(string: target) {
                        UIApplication.shared.open(url)
                    }
                }
            })
            .frame(height: 150.0)
        Spacer()
    }
    .padding(.top)
    .navigationBarTitle(Text("Simple integration"))
}
...
```

## Feeds in Onboardings

Various feeds can also be used in onboarding. See more in [OnboardingStory](OnboardingStory.md)
