# Тэги

1) Тэги можно задавать при инициализации библиотеки вместе `id` пользователя.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //объект настроек библиотеки
    let settings = Settings(userID: <String>, tags: <Array<String>>)
    
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>, settings: settings, sandBox: <Bool>)
    
    return true
}
```

2) Тэги можно задать с настройками пользователя после инициализации библиотеки через параметр `settings`

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>, sandBox: <Bool>)
     
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    return true
}
```

3) Так же тэги можно добавлять или удалять порциями уже после создания `StoryView`. Что бы изменения вступили всилу, необходимо обновить список (см. [Обновление](Refresh.md))

##### ViewController.swift
```swift
var storyView: StoryView!

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //инициализация StoryView
    view.addSubview(storyView) //добавление объекта на view
    
    storyView.create() //запуск внутренней логики
}

func addTags() {
    InAppStory.shared.addTags(<Array<String>>) //добавления списка тэгов
    
    storyView.refresh() //обновления списка сторис
}

func removeTags() {
    InAppStory.shared.removeTags(<Array<String>>) //удаления списка тэгов
    
    storyView.refresh() //обновления списка сторис
}
```