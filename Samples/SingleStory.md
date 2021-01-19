# SingleStory

Данный вид сторис открывается по заданому `id`, может использоваться для открытия из push-уведомления или быть привязанным к сущьности в приложении (например опрос или трейлер)

Для отображения `SingleStory` необходимо инициализировать InAppStory в проекте

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

Далее в контроллере, где необходимо показать единичную сторис, например обработалось PUSH уведомление или была нажата кнопка привязаная к сторис, вызвать у `InAppStory` метод `showSingeStory`

##### ViewController.swift
```swift 
... 

func pushNotification() {
    InAppStory.shared.showSingeStory(with: <String>, from: <UIViewController>, delegate: <SingleStoryDelegate>) {
        // замыкание обрабатывающее открытие ридера единичной сторис
    }
}
...
```
Так же, для отслеживания действий ридера с единичной сторис, необходимо реализовать методы делегата `SingleStoryDelegate`

##### ViewController.swift
```swift 
extension ViewController: SingleStoryDelegate
{
    func singleStoryUpdated(isContent: Bool) {
        // обработка получения ответа от сервера
    }
    
    // получение ссылки из сторис
    func singleStory(getLinkWith target: String) {
        // если обрабатываемыя ссылка ведёт на экран в приложении, желательно закрыть ридер
        InAppStory.shared.closeOnboarding {
            // далее обработать ссылку, например для перехода по ней в safari
            if let url = URL(string: target) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func singleStoryReaderWillShow() { 
        // ридер будет показан
    }
    
    func singleStoryReaderDidClose() { 
        // ридер закрылся
    }
}
```