# Кастомизация ячейки
## Кастомизация через свойства
Кастомизация через свойства изменяет внешний вид стандартной ячеки с фиксированым загруглением краём и толщиной обводки. Размеры так же распространяются на ячейку избранного. Для изменения внешнего вида, формы и поведения ячейки, необходимо создавать собственную ячейку, реализующую `StoryCellProtocol` и `FavoriteCellProtocol`, подробнее описано [здесь](https://github.com/inappstory/ios-sdk/blob/main/Samples/CustomCell.md#кастомизация-через-storycellprotocol-и-favoritecellprotocol).

1) Необходимо инициализировать InAppStory в проекте

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>, sandBox: Bool)
     
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    return true
}
```

2) Настроить внешний вид ячейки через параметры

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    ...
    
    // настройка внещнего вида
    InAppStory.shared.showCellTitle = true //отображение заголовка
    InAppStory.shared.showCellSource = true //отображение источника
    
    InAppStory.shared.cellBorderColor = .purple //цвет рамки вокруг не открытой ячейки 
    
    InAppStory.shared.cellFont = UIFont.systemFont(ofSize: 12.0) //шрифт заголовка (можно указать свой, предварительно подключив его в проект)
    InAppStory.shared.cellTitleColor = .white //цвет заголовка
    
    InAppStory.shared.cellSourceFont = UIFont.systemFont(ofSize: 12.0) //шрифт источника (можно указать свой, предварительно подключив его в проект)
    InAppStory.shared.cellSourceTitleColor = .black //цвет источника
}
```

3) В `ViewController` где будет находиться `StoryView` необходимо его создать

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //инициализация StoryView
    view.addSubview(storyView) //добавление объекта на view
    
    storyView.create() //запуск внутренней логики
}
```
4) Так же необходимо добавить `StoryViewDeleagateFlowLayout` и реализовать его

##### ViewController.swift
```swift 

...

override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //инициализация StoryView
    storyView.deleagateFlowLayout = self //определение делегата отображения списка
    
    view.addSubview(storyView) //добавление объекта на view
    
    storyView.create() //запуск внутренней логики
}
...
// Реализация методов StoryViewDeleagateFlowLayout
func sizeForItem() -> CGSize
{
    return CGSize(width: 160.0, height: 160.0) //размер ячейки
}

func insetForSection() -> UIEdgeInsets
{
    return UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0) //отступы от краёв StoryView
}

func minimumLineSpacingForSection() -> CGFloat
{
    return 4.0 //отступы между ячеками по вертикали
}

func minimumInteritemSpacingForSection() -> CGFloat
{
    return 4.0 //отступы между ячеками по горизонтали
}

```

## Кастомизация через `StoryCellProtocol` и `FavoriteCellProtocol`

1) Необходимо инициализировать InAppStory в проекте

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>, sandBox: Bool)
    
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    return true
}
```

2) В `ViewController` где будет находиться `StoryView` необходимо его создать

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //инициализация StoryView
    view.addSubview(storyView) //добавление объекта на view
    
    storyView.create() //запуск внутренней логики
}
```

3) Так же необходимо добавить `StoryViewDeleagateFlowLayout` и реализовать его

##### ViewController.swift
```swift
...
override func viewDidLoad() {
    super.viewDidLoad()
        
    storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //инициализация StoryView
    storyView.deleagateFlowLayout = self //определение делегата отображения списка
    
    view.addSubview(storyView) //добавление объекта на view
    
    storyView.create() //запуск внутренней логики
}
...
// Реализация методов StoryViewDeleagateFlowLayout
func sizeForItem() -> CGSize
{
    return CGSize(width: 160.0, height: 160.0) //размер ячейки
}

func insetForSection() -> UIEdgeInsets
{
    return UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0) //отступы от краёв StoryView
}

func minimumLineSpacingForSection() -> CGFloat
{
    return 4.0 //отступы между ячеками по вертикали
}

func minimumInteritemSpacingForSection() -> CGFloat
{
    return 4.0 //отступы между ячеками по горизонтали
}

```

4) для ячейки списка неодходимо создать класс реализующий протокол `StoryCellProtocol`

##### CustomStoryCell.swift
```swift
class CustomStoryCell: UICollectionViewCell 
{
    // reuseIdentifier ячеки
    static var reuseIdentifier: String {
        return String(describing: self) 
    }
    
    // nib файл ячеки, если ячека создавалась только кодом необходимо вернуть nil
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// реализация протокола StoryCellProtocol
extension CustomStoryCell: StoryCellProtocol
{
    func setTitle(_ text: String) {
        // установка значения заголовка
    }
    
    func setSource(_ text: String) {
        // установка значения источника
    }
    
      func setImageURL(_ url: URL) {
        // ссылка на обложку ячеки
    }
    
    func setOpened(_ value: Bool) {
        // значение открытия сторис
    }
    
    func setHighlight(_ value: Bool) {
         // значение зажатие ячекив списке пальцем
    }
    
    func setBackgroundColor(_ color: UIColor) {
           // установка цвета фона картинки
    }
    
    func setBack(_ color: UIColor) {
           // установка цвета фона ячеки
    }
    
    func setTitleColor(_ color: UIColor) {
           // установка цвета заголовка
    }
}
```

5) если в приложении будет включен функционал избранного создать класс реализующий протокол `FavoriteCellProtocol`

##### CustomFavoriteCell.swift
```swift
class CustomFavoriteCell: UICollectionViewCell
{
    // reuseIdentifier ячеки

    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // nib файл ячеки, если ячека создавалась только кодом необходимо вернуть nil
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// реализация протокола FavoriteCellProtocol
extension StoryFavoriteCell: FavoriteCellProtocol
{
    func setImages(_ urls: Array<URL?>) {
        // список ссылок первых четырёх ячеек избранного, может быть меньше 4-х
    }
    
    func setImagesColors(_ colors: Array<UIColor?>) {
        // список фоновых цветов обложек
    }
    
    func setHighlight(_ value: Bool) {
        // значение зажатие ячекив списке пальцем
    }
    
    func setBackgroundColor(_ color: UIColor) {
        // установка цвета фона ячеки
    }
}
```

---  

**Обратите внимание!**  
У библиотеки нет доступа к кастомной ячейки, кроме как реализации протокола `FavoriteCellProtocol` и для поддержания отображения актуальной иформации и избежания дублей миниатюр, желательно чистить изображения и цвета при каждом вызове методов `setImages` и `setImagesColors`

---

6) далее необходимо указать данные ячейки у экземпляра класса `StoryView`

##### ViewController.swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    let storyView = StoryView(frame: CGRect(x: 0.0, y: 100.0, width: 320.0, height: 160.0)) //инициализация StoryView
    
    storyView.storyCell = CustomStoryCell()
    storyView.favoriteCell = CustomFavoriteCell()
    
    view.addSubview(storyView) //добавление объекта на view
    
    storyView.create() //запуск внутренней логики
}
```
