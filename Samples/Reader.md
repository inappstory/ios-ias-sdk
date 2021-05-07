# Кастомизация ридера

#### Изменение внешноего види ридера:

1. [Полжение кнопки "Закрыть"](https://github.com/inappstory/ios-sdk/blob/main/Samples/Reader.md#полжение-кнопки-закрыть)
2. [Изменение иконок в нижней панеле](https://github.com/inappstory/ios-sdk/blob/main/Samples/Reader.md#изменение-иконок-в-нижней-панеле)
3. [Изменение прелоадера на не загруженных карточках](https://github.com/inappstory/ios-sdk/blob/main/Samples/Reader.md#изменение-прелоадера-на-не-загруженных-карточках)
4. [Анимация появления](https://github.com/inappstory/ios-sdk/blob/main/Samples/Reader.md#анимация-появления)
5. [Анимация перелистывания](https://github.com/inappstory/ios-sdk/blob/main/Samples/Reader.md#анимация-перелистывания)

### Полжение кнопки "Закрыть"

При инициализации библиотеки в приложении необходимо указать `closeButtonPosition`. По умолчанию выставлено положение `right`.  
В библиотеке пердусмотрено 4 положения кнопки "Закрыть": 

* right - справа, на уровне таймеров
* left - слева, на уровне таймеров
* bottomRight - справа, под таймера
* bottomLeft - слева, под таймерами

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    InAppStory.shared.closeButtonPosition = <ClosePosition>
    
    return true
}
```
--
### Изменение иконок в нижней панеле

Иконки нижней панели можно заменять на любые изображения. У каждй кнопки имеется 2 состаяния, обычное и выделенное. Размер изображения желательно использовать 24x24 pt.

Для отображения нижней панели с кнопками необходимо после инициализации библиотеки указать функционал панели и убедится, что данный функционал доступен и включён в консоли. Далее указать все варианты необходимых картинок.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    InAppStory.shared.likePanel = <Bool> // включение панели кнопок с лайками
    InAppStory.shared.favoritePanel = <Bool> // включение панели кнопок с избранным
    InAppStory.shared.sharePanel = <Bool> // включение панели кнопок с шарингом
    
    InAppStory.shared.likeImage = <UIImage>
    InAppStory.shared.likeSelectedImage = <UIImage>
    InAppStory.shared.dislikeImage = <UIImage>
    InAppStory.shared.dislikeSelectedImage = <UIImage>
    InAppStory.shared.favoriteImage = <UIImage>
    InAppStory.shared.favoriteSelectedImag = <UIImage>
    InAppStory.shared.shareImage = <UIImage>
    InAppStory.shared.shareSelectedImage = <UIImage>
    
    // Изменение иконок звука
    InAppStory.shared.soundImage = <UIImage> // Звук включён
    InAppStory.shared.soundSelectedImage = <UIImage> // Звук отключён
    
    return true
}
```
--

### Изменение прелоадера на не загруженных карточках

Во время первой загрузки и последующем пролистывании может отображаться прелоадер, пока не будет загружен контент сторис. Анимацию прелоадера можно изменить, для этого необходимо создать `UIView` и реализовать в нём протокол `PlaceholderProtocol` и после инициализации библиотеки указать его библиотеке.

##### CustomPlaceholderView.swift
```swift
class CustomPlaceholderView: UIView, PlaceholderProtocol
{
    var isAnimate: Bool {
        get {
            return <Bool> // значение состаяния анимации
        }
    }
    
    func start() {
        // запуск анимации
    }
    
    func stop() {
        // остановка анимации
    }
}
```

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)

    InAppStory.shared.placeholderView = CustomPlaceholderView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
    
    return true
}
```
--
### Анимация появления

Показ ридера может осуществлятся двумя видами анимации:

* crossDissolve - анимация alpha от 0 до 1
* modal - выезд ридера из под нижней части экрана

Установка вида анимации осуществляется после инициализации библиотеки в приложении.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)

    InAppStory.shared.presentationStyle = <PresentationStyle>
    
    return true	
}
```
--
### Анимация перелистывания

Перелистывание сторис в ридере может сопровождаться несколькими анимациями:

* flat - простое последовательное замощение 
* cover - наезжание следующей сторис на предыдущую с эфектом паралакса
* cube - каждая сторис находится на грани куба (like instagram)

Установка вида анимации осуществляется после инициализации библиотеки в приложении.

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>)
    
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)

    InAppStory.shared.scrollStyle = <ScrollStyle>
    
    return true
}
```
