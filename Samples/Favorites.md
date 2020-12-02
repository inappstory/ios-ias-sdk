# Избранное

Экран избранного создаётся так же как и лента сторис, через `StoryView` с параметром `favorite = true`.

##### FavoritesController

```swift
class FavoritesController: UIViewController {

    var favoritesView: StoryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoritesView = StoryView(frame: CGRect(x: 0.0, y: 100, width: 320, height: 160.0), favorite: true)
        favoritesView.target = self
        favoritesView.delegate = self
        
        view.addSubview(favoritesView)
                
        favoritesView.create()
    }
}

extension FavoritesController: StoryViewDeleagate
{
    func storyViewUpdated(storyView: StoryView) {
        //обновление списка сторис
    }
    
    // получение ссылки из сторис
    func storyView(_ storyView: StoryView, getLinkWith target: String) {
        // если обрабатываемыя ссылка ведёт на экран в приложении, желательно закрыть ридер
        storyView.closeStory()
        
        // далее обработать ссылку, например для перехода по ней в safari
        if let url = URL(string: target) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func storyReaderWillShow() {
        //вызывается перед открытием ридерв
    }
    
    func storyReaderDidClose() {
        //вызывается после закрытия ридера
    }
}
``` 