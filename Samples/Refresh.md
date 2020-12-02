# Обновление

Для обновления списка необходимо вызвать `refresh()` у `StoryView`, например если необходимо реализовать Pull to refresh.  
При вызове `refresh()` будут перезапрошены данные для списка соответвующие действующей сессии пользователя и списку тэгов.  
  
Так же смотреть - [Сменя пользователя](UserChange.md), [Смена тэгов](Tags.md)

##### ViewController.swift
```swift
...

var storyView: StoryView!

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //инициализация StoryView
    view.addSubview(storyView) //добавление объекта на view
    
    storyView.create() //запуск внутренней логики
}

func refresh() {
    storyView.refresh()
}
...
```