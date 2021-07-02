# InAppStorySDK in iOS 14 Widget

IOS 14 widgets can use data from **InAppStorySDK**, for this a simplified story model *[WidgetStory](https://github.com/inappstory/ios-sdk#WidgetStory)*, was added. This model contains the main fields for presentation stories in the widget.

IOS 14 widgets are created in pure SwiftUI and have a number of limitations compared to a regular application in the same language: 

* **Scroll** cannot be used
* video and animated images cannot be used
* to communicate with the main application and track the actions of components, you should use **Deeplink**

Using the example of implementing a simple widget, we will analyze how to display a list of 4 stories and link it to the main application.
>**Remark**  
>SwiftUI is flexible enough that you can find a more elegant and simpler way to build this widget.

### Creating a widget target in a project 
 
1. To create a widget target, select a project in *FileInspector* and press *"+"* in the *TARGETS* field. 
2. Then select *Widget Extension* in the drop-down window and set all the necessary parameters to it. 
1. **XCode** will automatically create a folder containing a **SwiftUI** file with default parameters.

Initially, the widget is created with the size of `.systemSmall` and only it is displayed in the preview.
To add multiple sizes, you can add them to the widget view using `.supportedFamilies(Array<WidgetFamily>)`

```swift
@main
struct StoryWidget: Widget {
    let kind: String = "StoryWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StoryWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium]) // widget sizes
    }
}
```

In order for the preview to display all sizes, you need to add a group of all required sizes to *Widget_Previews*

```swift
struct StoryWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemSmall)) //small square 2x2
            StoryWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemMedium)) //rectangle 4x2
        }
    }
}
```

Now in the preview you can see all the available sizes of the widget.
>**Remark**  
> To use the preview, it is better to create a new project or **Playground**. To generate the view, XCode periodically rebuilds the entire project.


### Widget structure

1) To create the structure of the widget, you should use *WidgetEntryView*

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        // widget body
    }
}
```

2) The widget will consist of a title and a list of the first 4 stories, for this you need to create *HStack* and create a title in it

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(spacing: 12.0) {
            Text("Stories")
                .foregroundColor(.black)
        }
    }
}
```

3) Next, you need to create list items *StoryCard* to display stories

```swift
struct StoryCard : View {
    let storyID: String  //source id
    let imageURL: String //image link
    let color: String    //background color in HEX format
    
    var body: some View {
        ZStack {
            if imageURL == "" {
                Color(hex: color)
            } else {
                NetworkImage(url: URL(string: imageURL))
            }
        }
    }
}
```

4) For convert color from HEX format, you need to add an extension for **Color** 

```swift
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
```

5) It is necessary to create a structure for loading images using the link *NetworkImage*

```swift
struct NetworkImage: View {
    let url: URL?
    
    var body: some View {
        Group {
            if let url = url, let imageData = try? Data(contentsOf: url),
               let uiImage = UIImage(data: imageData) {
                
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            else {
                Color.gray
            }
        }
    }
}
```

6) In the card, you need to display the title of the story, for this we will create the title structure *CardTitle*

```swift
struct CardTitle : View {
    let title: String
    
    var body: some View {
        ZStack {
            Text(title)
                .font(Font.system(size: 11.0))
                .fontWeight(.regular)
                .lineSpacing(0.0)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .padding(.horizontal, 8.0)
                .padding(.vertical, 6.0)
        }
    }
}
```

Now you have all the elements to put together the list.

The physical dimensions of the widget can change for different screen sizes of the device, for this you need to add the dimensions of the story cards depending on the size of the widget in pixels.

```swift
struct StoryList : View {
    let list: Array<Dictionary<String, String>> // list of stories received from the application
    
    var body: some View {
        GeometryReader { geometry in
            let ratio = CGFloat(80.0 / 110.0)
            let width = (geometry.size.width - 50.0) / 4.0
            HStack(spacing: 6.0) {
                ForEach(0..<4) {
                    if $0 < list.count {
                        let story = list[$0]
                        StoryCard(storyID: story["id"]!,imageURL: story["image"]!, color: story["color"]!)
                            .frame(width: width, height: width / ratio, alignment: .center)
                            .overlay(CardTitle(title: story["title"]!), alignment: .bottomLeading)
                            .clipShape(ContainerRelativeShape())
                    } else { // if there are less than four elements, then we put a placeholder
                        Color.gray
                            .frame(width: width, height: width / ratio, alignment: .center)
                            .clipShape(ContainerRelativeShape())
                    }
                }
            }
            .padding(.horizontal, 16.0)
        }
    }
}
```
To get the size of the parent element, use the `GeometryReader`, from it you can get the sizes.

For rounded cards use `.clipShape(ContainerRelativeShape())`. It is tied to radius and size, widget and system (*rec. Apple*). 

Overlay (`.overlay`) is used to display the header, thus providing bottom alignment and anchoring to the card.

Also update the `StoryWidgetEntryView` and add `StoryList` to *VStack*

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(spacing: 12.0) {
            Text("Stories")
                .foregroundColor(.black)
            StoryList(list: Array<Dictionary<String, String>>)
        }
    }
}
```

### Retrieving data

To get data from a widget, you can use

* [Keychain access group](https://developer.apple.com/documentation/security/keychain_services/keychain_items/sharing_access_to_keychain_items_among_a_collection_of_apps) — well suited if you need to transfer some server-side token, key or any other sensitive information.
* [App group](https://www.appcoda.com/app-group-macos-ios-communication/) — provides more opportunities, but less security. You can share `UserDefaults`, as well as disk space.

There is no valuable information in the list of stories, the second method with **App group** will be used. To do this, you need to create a group for the application at [developer.apple.com](https://developer.apple.com/account/resources/identifiers/list/applicationGroup), specifying the name and ID of the group. Next, you need to add them to the project and widget targets, in the *Signing & Capabilities* tab add *App Group* and specify the ID of the created group.  
When installing the application, a "sandbox" will be created for the application, which will be accessible for the widget and the parent application.

To access the "sandbox" you need to use `UserDefaults(suiteName: <"group ID">)`, and then work as with the usual *UserDefaults*

Add data retrieval from *UserDefaults* to `StoryWidgetEntryView` and extract the list of stories from it

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry
    
    var defaults = UserDefaults(suiteName: <"ID группы">)

    var body: some View {
        VStack(spacing: 12.0) {
            Text("Stories")
                .foregroundColor(.black)
            if defaults != nil,
            let storiesList = defaults?.array(forKey: "widget_stories") as? Array<Dictionary<String, String>> {
                if storiesList.isEmpty {
                    // list is empty
                } else {
                    StoryList(list: storiesList)
                }
            } else {
                // failed to get list from UserDefaults
            }
        }
    }
}

```

### Updating widget data

To update the data, use the `getTimeline` method generated when creating the widget. It sets the time intervals after which the widget is updated. It can be left by default (the forced update of the widget will occur in the application).

To update the widget from the application, you need to use **WidgetKit** and `WidgetCenter.shared.reloadAllTimelines()`, this method will redraw all the widgets available on the screen.

To get data for a widget from **InAppStorySDK**, use the `getWidgetStories` method with a closure in which a list of models *WidgetStory* is returned

```swift
// check iOS version
if #available(iOS 14.0, *) {
    InAppStory.shared.getWidgetStories { (widgetStories) in
        
        if let stories = widgetStories { // check data from closure
            var storiesForDefaults: Array<Dictionary<String, String>> = []
            let defaults = UserDefaults(suiteName: <"Group ID">) // get access to AppGroup
            
            // assembling an array to save
            for story in stories {
                storiesForDefaults.append(["id" : story.id,
                                           "title" : story.title,
                                           "image" : story.image,
                                           "color" : story.color])
            }
            
            // storing array in UserDefaults AppGroup
            defaults?.setValue(storiesForDefaults, forKey: "widget_stories")
            
            // checking the build architecture
            #if arch(arm64) || arch(i386) || arch(x86_64)
            WidgetCenter.shared.reloadAllTimelines() // updating widgets
            #endif
        }
    }
}
```
> **Remark**  
> It is necessary to check for the version of the operating system, so as not to make unnecessary requests if iOS <14.0  
> It is also necessary to check the build architecture for *WidgetCenter*, otherwise errors may occur during compilation

The *WidgetStory* list can also be obtained in the `StoryView` - `storyViewUpdated` delegate method, from the `widgetStories: Array<WidgetStory>?` parametr.

```swift
extension ViewController: StoryViewDelegate
{
    func storyViewUpdated(storyView: StoryView, widgetStories: Array<WidgetStory>?)
    {
        if #available(iOS 14.0, *) {
            if let stories = widgetStories {
                var storiesForDefaults: Array<Dictionary<String, String>> = []
                let defaults = UserDefaults(suiteName: <"Group ID">)
                
                for story in stories {
                    storiesForDefaults.append(["id" : story.id,
                                               "title" : story.title,
                                               "image" : story.image,
                                               "color" : story.color])
                }
                
                defaults?.setValue(storiesForDefaults, forKey: "widget_stories")
                
                #if arch(arm64) || arch(i386) || arch(x86_64)
                WidgetCenter.shared.reloadAllTimelines()
                #endif
            }
        }
    }
    ...
}
```

### Empty list or no data

When updating the widget, the list of stories may be empty or completely absent (*for example, when installing the widget for the first time*), for this it is recommended to make placeholders with a proposal to go into the application and update the list.

To do this, create an `EmptyList` structure in the widget and add it to the place where the widget is drawn, where it is possible to get an empty list or lack of data.

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry
    
    var defaults = UserDefaults(suiteName: <"Group ID">)

    var body: some View {
        VStack(spacing: 12.0) {
            Text("Истории")
                .foregroundColor(.black)
            if defaults != nil,
            let storiesList = defaults?.array(forKey: "widget_stories") as? Array<Dictionary<String, String>> {
                if storiesList.isEmpty {
                    EmptyList() // empty list
                } else {
                    StoryList(list: storiesList)
                }
            } else {
                EmptyList() // failed to get list from UserDefaults
            }
        }
    }
}

struct EmptyList : View {
    var body: some View {
        GeometryReader { geometry in
            let ratio = CGFloat(80.0 / 110.0)
            let width = (geometry.size.width - 50.0) / 4.0
            ZStack {
                HStack(spacing: 6.0) {
                    ForEach(0..<4) {_ in
                        RoundedRectangle(cornerRadius: 0.0)
                            .frame(width: width, height: width / ratio, alignment: .center)
                            .foregroundColor(Color.gray)
                            .clipShape(ContainerRelativeShape())
                    }
                }
                .blur(radius: 5.0)
                .padding(.horizontal, 16.0)
                VStack(spacing: 8.0) {
                    Text("Application must be open")
                        .foregroundColor(.white)
                    Link(destination: URL(string: "storywidget://login")!) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.green)
                            Text("Войти")
                                .padding(.top, 4)
                                .padding(.bottom, 4)
                                .padding(.horizontal, 12)
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 80, height: 30, alignment: .center)
                }
            }
        }
    }
}
```

### Opening stories on touch

To open a specific story by touch, you should use **Deeplink** and open the story as *SingleStory* in the application by its *ID (slug)* (more details [SingleStory](SingleStory.md))

To add links to the cards of the widget, you need to wrap the picture in a `Link` object

```swift
struct StoryCard : View {
    let storyID: String
    let imageURL: String
    let color: String
    
    var body: some View {
        ZStack {
            if imageURL == "" {
                Color(hex: color)
            } else {
                // story deeplink with ID
                Link(destination: URL(string: "storywidget://\(storyID)")!) {
                    NetworkImage(url: URL(string: imageURL))
                }
            }
        }
    }
}
```
> **Remark**  
> The application opens regardless of whether the link was clicked or there was just a tap on the widget, and the link is sent later.
