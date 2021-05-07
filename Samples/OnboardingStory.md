# OnboardingStory

Данный вид сторис является отдельным списком, который настраивается в консоли. Может служить для отображения преветственных экранов, рекламы и т.п.

Для отображения онбордингов необходимо инициализировать InAppStory в проекте

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

Далее в контроллере, где необходимо показать онбординги нужно вызвать у `InAppStory` метод `showOnboarding`, например при загрузке контроллера

##### ViewController.swift
```swift 
... 

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    InAppStory.shared.showOnboarding(from: <UIViewController>, delegate: <OnboardingDelegate>) {
        // замыкание обрабатывающее открытие ридера единичной сторис
    }
}
...
```

Так же, для отслеживания действий ридера онбордингов, необходимо реализовать методы делегата `OnboardingDelegate`

```swift 
extension ViewController: OnboardingDelegate
{
    func onboardingUpdated(isContent: Bool) {
        // обработка получения ответа от сервера
    }
    
    // получение ссылки из сторис
    func onboardingReader(actionWith target: String, for type: ActionType) {
        if type == .swipe { // ссылка получена по действию swipeUP
           if let url = URL(string: target) {
               let swipeContentController = SwipeContentController()
               // передача ссылки контроллеру с WebView
               swipeContentController.linkURL = url
               // открытие контроллера поверх ридера
               InAppStory.shared.onboardingPresent(controller: swipeContentController)
           }
       } else {
            // если обрабатываемыя ссылка ведёт на экран в приложении, желательно закрыть ридер
            InAppStory.shared.closeOnboarding {
                // далее обработать ссылку, например для перехода по ней в safari
                if let url = URL(string: target) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    func onboardingReaderWillShow() {
        // ридер будет показан
    }
    
    func onboardingReaderDidClose() {
        // ридер закрылся
    }
}
```