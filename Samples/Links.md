# Обработчик ссылок

В сторис на кнопках, а так же на действие `swipeUP` могут приходить ссылки. Или сама стори может быть ссылкой без открытия ридера. Для получения данных ссылок необходимо указать для `StoryView` делегат и реализовать метод `storyView(_ storyView: <StoryView>, actionWith type: <ActionType>, for target: <String>)`, где `storyView` это откуда пришла ссылка, `type` это способ открытия данной ссылки, а `target` это текстовая ссылка.

Для обработки ссылок из онбордингов и единичных сторис см. [SingleStory](SingleStory.md) и [OnboardingStory](OnboardingStory.md)

1) Необходимо инициализировать библиотеку

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
     InAppStory.shared.initWith(serviceKey: <String>)
    
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    return true
}
```

2) Создать `StoryView` и указать у неё делегать

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //инициализация StoryView
    storyView.delegate = self
    
    view.addSubview(storyView) //добавление объекта на view
    
    storyView.create() //запуск внутренней логики
}
```

3) Реализовать метод делегата для получения ссылки

##### ViewController.swift
```swift
extension ViewController: StoryViewDeleagate
{
    ...
    
    // получение ссылки из сторис
    func storyView(_ storyView: StoryView, actionWith type: ActionType, for target: String) {
       if type == .swipe { // ссылка получена по действию swipeUP
           if let url = URL(string: target) {
               let swipeContentController = SwipeContentController()
               // передача ссылки контроллеру с WebView
               swipeContentController.linkURL = url
               // открытие контроллера поверх ридера
               storyView.present(controller: swipeContentController)
           }
       } else {
            // если обрабатываемыя ссылка ведёт на экран в приложении, желательно закрыть ридер
            storyView.closeStory {
                // далее обработать ссылку, например для перехода по ней в safari
                if let url = URL(string: target) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    ...
}
```