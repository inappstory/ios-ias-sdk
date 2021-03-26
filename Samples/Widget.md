# Использвание InAppStorySDK в виджете iOS 14

В новых виджетах iOS 14 можно использовать данные из **InAppStorySDK**, для этого была добавлена упрощённая модель истории *[WidgetStory](https://github.com/inappstory/ios-sdk#WidgetStory)*, содержащая в себе основные поля для представления истории в виджете.

Виджеты для iOS 14 создаются на чистом SwiftUI и имеют ряд ограницений по сравнению с обычным приложением на том же языке:  

* нельзя использовать **Scroll**
* Нельзя использовать видео и анимированые изображения
* для связи с приложением и отслеживания нажатия определённых компонентов виджета необходимо использвать **Deeplink**

Далее на примере реализации разберём как сделать простой виджет со списком из 4 историй и связать его с основным приложением.
>**Примечание**  
>SwiftUI достаточно гибок и вы можете найти более элегантный ипростой способ построения данного виджета.

### Создание таргета виджета в проекте  
Для создание таргета виджета необходимо, в *FileInspector* выбрать проект и в поле *TARGETS* нажать *"+"*. Далее в выпадающем окне выбрать *Widget Extension* и задать ему все необходимые параметры.
После выполненных действий создастся папка содержащая файл **SwiftUI** с параметрами по умолчанию.

Изначально виджет создайтся с размером `.systemSmall` и в превью отображается только он. Для добавления нескольких размеров можно добавить их в представление виджета с помощю `.supportedFamilies(Array<WidgetFamily>)`

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
        .supportedFamilies([.systemSmall, .systemMedium]) // размеры виджета
    }
}
```

Для того, что бы в превью отобразились оба представления необходимо *Widget_Previews* добавить группу всех необходимых размеров

```swift
struct StoryWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            StoryWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
```

Теперь в превью можно увидетьт все доступные размеры виджета.
>**Примечание**  
> Для использования превью лучше использовать новый проект или **Playground**, т.к. на его генерацию XCode периодически пересобирает весь проект.


### Структура виджета
Для создания структуры виджета необходимо использовать *WidgetEntryView*

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        // тело виджета
    }
}
```

Виджет будет состоятьт из заголовка и списка первых 4-х сторис, для этого необходимо создать *HStack* и в нём создать заголовок

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(spacing: 12.0) {
            Text("Истории")
                .foregroundColor(.black)
        }
    }
}
```

Далее необходимо создать элементы списка виджета *StoryCard* для отображения самих историй

```swift
struct StoryCard : View {
    let storyID: String //id истории
    let imageURL: String // ссылка на изображение
    let color: String // цвет фона в формате HEX
    
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
Для конвертации цвета из HEX формата необходимо добавить расширение для **Color** 

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

Так же необходимо создать структуру для загрузки картинок по ссылке *NetworkImage*

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

В карточке так же необходимо отображать заголовок истории, для этого создадим структуру заголовка *CardTitle*

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

Теперь есть все элементы, что бы собрать список.
Стандартные размеры виджета могут отличаться для разных размеров размеров экрана устройства, по этому необходимо так же добавить размеры карты стори в зависимости от размера виджета в пикселях. 

```swift
struct StoryList : View {
    let list: Array<Dictionary<String, String>> // список сторис полученных из приложения
    
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
                    } else { // если элементов меньше четырёх, то ставим заглушку
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
Для отслеживания размеров геометрии родительского элемента используется `GeometryReader` из которого можно получить размеры. Так же, для закруглений карточек используется `.clipShape(ContainerRelativeShape())` с привязкой радиуса к размерам и радиуса самого виджета и системы (*рек. Apple*).  
Для отображения заголовка используется наложение (`.overlay`), таким образом обеспечивается выравнивание по нижнему краю и привязка к карточке.

Так же обновим `StoryWidgetEntryView` и добавим в *VStack* `StoryList`

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(spacing: 12.0) {
            Text("Истории")
                .foregroundColor(.black)
            StoryList(list: Array<Dictionary<String, String>>)
        }
    }
}
```

### Получение данных
Для получения данных виджетом, можно использовать

* [Keychain access group](https://developer.apple.com/documentation/security/keychain_services/keychain_items/sharing_access_to_keychain_items_among_a_collection_of_apps) — хорошо подойдет если нужно передать какой-нибудь сервер-сайд токен, ключ или любую другую сенситив информацию.
* [App group](https://www.appcoda.com/app-group-macos-ios-communication/) — предоставляет больше возможностей, но меньше секьюрити. Можно шарить `UserDefaults`, а также место на диске.

Т.к. очень ценной информации в списке историй нет, будет использоваться второй способ с **App group**. Для этого необходимо создать группу для приложения на [developer.apple.com](https://developer.apple.com/account/resources/identifiers/list/applicationGroup), указав название и идентификатор группы. Далее в проекте добавить у таргетов проекта и виджета, во вкладке *Signing&Capabilities* добавить *App Group* и указать идентификатор созданной группы.  
Таким образом при установке приложения будет создана "песочница" для приложения в которую будет доступ для виджета и самого приложения.

Для доступа к песочнице необходимо использовать `UserDefaults(suiteName: <"ID группы">)`, а далее работать как с обычным *UserDefaults*

Добавим получение данных из *UserDefaults* в `StoryWidgetEntryView` и получим из него список сторис

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry
    
    var defaults = UserDefaults(suiteName: <"ID группы">)

    var body: some View {
        VStack(spacing: 12.0) {
            Text("Истории")
                .foregroundColor(.black)
            if defaults != nil,
            let storiesList = defaults?.array(forKey: "widget_stories") as? Array<Dictionary<String, String>> {
                if storiesList.isEmpty {
                    // список пуст
                } else {
                    StoryList(list: storiesList)
                }
            } else {
                // не удалось получить список из UserDefaults
            }
        }
    }
}

```

### Обновление данных виджета

Для обновления данных внутри виджета используется метод `getTimeline` сгенерировный при создании таргета. В нём задаётся временые промежутки по окончании которых происходит перересовка виджета. Его можно оставить по умолчанию (принудительное обновление виджета будет происходить в приложении)

Для обновления виджета из приложения необходимо использовать **WidgetKit** и `WidgetCenter.shared.reloadAllTimelines()`, который перерисует все виджеты доступные на экране.

Для получения данных для виджета в **InAppStorySDK** добавлен метод `getWidgetStories` с замыканием в котором возвращается список моделей *WidgetStory*

```swift
// проверка на версию iOS
if #available(iOS 14.0, *) {
    InAppStory.shared.getWidgetStories { (widgetStories) in
        
        if let stories = widgetStories { // проверка полученого замыкания
            var storiesForDefaults: Array<Dictionary<String, String>> = []
            let defaults = UserDefaults(suiteName: <"ID группы">) // получения доступа к AppGroup
            
            // сборка массива для сохранения
            for story in stories {
                storiesForDefaults.append(["id" : story.id,
                                           "title" : story.title,
                                           "image" : story.image,
                                           "color" : story.color])
            }
            
            // сохранение массива в UserDefaults AppGroup
            defaults?.setValue(storiesForDefaults, forKey: "widget_stories")
            
            // проверка архитектуры сборки
            #if arch(arm64) || arch(i386) || arch(x86_64)
            WidgetCenter.shared.reloadAllTimelines() // обновление виджетов
            #endif
        }
    }
}
```
> **Примечание**  
> Необходимо установить проверку на версию операционной системы, что бы не делать лишние запросы если iOS < 14.0  
> Так же необходимо поставить проверку на архитектуру сборки для *WidgetCenter*, иначе могут возникнуть ошибки при компиляции

Так же список *WidgetStory* можно получить в методе делегата `StoryView` - `storyViewUpdated`, в котором добавился параметр со списком.

```swift
extension ViewController: StoryViewDeleagate
{
    func storyViewUpdated(storyView: StoryView, widgetStories: Array<WidgetStory>?)
    {
        if #available(iOS 14.0, *) {
            if let stories = widgetStories {
                var storiesForDefaults: Array<Dictionary<String, String>> = []
                let defaults = UserDefaults(suiteName: <"ID группы">)
                
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

### Пустой список или отсутствие данных
При обновлении виджета список сторис может оказаться пустым или вовсе отсутствовать (*например, при первой установки виджета*), для этого рекомендуется сделать заглушку с предложением зайти в приложение и обновить список. Для этого в виджете создадим структуру `EmptyList` и добавим его в место отрисовки виджета, где возможно получить пустой список или отсутсвие данных.

```swift
struct StoryWidgetEntryView : View {
    var entry: Provider.Entry
    
    var defaults = UserDefaults(suiteName: <"ID группы">)

    var body: some View {
        VStack(spacing: 12.0) {
            Text("Истории")
                .foregroundColor(.black)
            if defaults != nil,
            let storiesList = defaults?.array(forKey: "widget_stories") as? Array<Dictionary<String, String>> {
                if storiesList.isEmpty {
                    EmptyList() // список пуст
                } else {
                    StoryList(list: storiesList)
                }
            } else {
                EmptyList() // не удалось получить список из UserDefaults
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
                    Text("Необходимо войти в приложение")
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

### Открытие сторис по нажатию
Для открытия конкретной сторис по нажатию необходимо использовать **Deeplink** и открывать историю как *SingleStory* в приложении по её *ID (slug)* (подробнее [SingleStory](SingleStory.md))

Для добавления ссылок на карточки виджета необходимо картинку обернуть в объект `Link`

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
                // deeplinnk ссылка стори по её ID
                Link(destination: URL(string: "storywidget://\(storyID)")!) {
                    NetworkImage(url: URL(string: imageURL))
                }
            }
        }
    }
}
```
> **Примечание**  
> Приложение открывается не зависимо от того была ли нажата ссылка или просто произошёл тап на виджете, а сама ссылка отправляется уже позже.








