# InAppStory

Библиотека для представления Stories с возможностью кастомизации.

## Содержание
* [Установка](https://github.com/inappstory/ios-sdk#установка)
	* [Ручная установка](https://github.com/inappstory/ios-sdk#ручная-установка)
	* [Установка с CocoaPods](https://github.com/inappstory/ios-sdk#Установка-с-CocoaPods)
	* [Podfile](https://github.com/inappstory/ios-sdk#Podfile)
	* [Удаление неиспользуемой архитектуры при компиляции](https://github.com/inappstory/ios-sdk#Удаление-неиспользуемой-архитектуры-при-компиляции)
* [InAppStory](https://github.com/inappstory/ios-sdk#InAppStory)
	* [Инициализация](https://github.com/inappstory/ios-sdk#Инициализация)
	* [Параметры и свойства](https://github.com/inappstory/ios-sdk#Параметры-и-свойства)
	* [Кастомизация](https://github.com/inappstory/ios-sdk#Кастомизация)
* [StoryView](https://github.com/inappstory/ios-sdk#StoryView)
	* [Инициализация](https://github.com/inappstory/ios-sdk#Инициализация)
	* [Методы](https://github.com/inappstory/ios-sdk#Методы)
	* [Параметры и свойства](https://github.com/inappstory/ios-sdk#Параметры-и-свойства)
* [OnboardingStory](https://github.com/inappstory/ios-sdk#OnboardingStory)
	* [Отображение](https://github.com/inappstory/ios-sdk#Отображение)
* [SingleStory](https://github.com/inappstory/ios-sdk#SingleStory)
	* [Отображение](https://github.com/inappstory/ios-sdk#Отображение)
* [Протоколы](https://github.com/inappstory/ios-sdk#Протоколы)
	* [StoryViewDeleagate](https://github.com/inappstory/ios-sdk#StoryViewDeleagate)
	* [StoryViewDeleagateFlowLayout](https://github.com/inappstory/ios-sdk#StoryViewDeleagateFlowLayout)
	* [OnboardingDelegate](https://github.com/inappstory/ios-sdk#OnboardingDelegate)
	* [SingleStoryDelegate](https://github.com/inappstory/ios-sdk#SingleStoryDelegate)
	* [StoryCellProtocol](https://github.com/inappstory/ios-sdk#StoryCellProtocol)
	* [FavoriteCellProtocol](https://github.com/inappstory/ios-sdk#FavoriteCellProtocol)
* [enum](https://github.com/inappstory/ios-sdk#enum)
	* [ScrollStyle](https://github.com/inappstory/ios-sdk#ScrollStyle)
	* [PresentationStyle](https://github.com/inappstory/ios-sdk#PresentationStyle)
	* [ClosePosition](https://github.com/inappstory/ios-sdk#ClosePosition)
* [Объекты](https://github.com/inappstory/ios-sdk#Объекты)
	* [Settings](https://github.com/inappstory/ios-sdk#Settings)
* [NotificationCenter](https://github.com/inappstory/ios-sdk#NotificationCenter)
	* [События](https://github.com/inappstory/ios-sdk#События)
	* [Ошибки](https://github.com/inappstory/ios-sdk#Ошибки)
* [Примеры](Samples/Samples.md)

## Установка

| InAppStory version | Build version | iOS version |
|--------------------|---------------|-------------|
| 1.2.0              | 1102          | >= 10.0     |

Версию библиотеки можно получить из параметра `InAppStory.buildInfo`

### Ручная установка

Установка осуществляется путём подключения к проекту `InAppStorySDK.xcframework` библиотеки.

### Установка с CocoaPods

CocoaPods - это менеджер зависимостей для Objective-C, который автоматизирует и упрощает процесс использования сторонних библиотек в ваших проектах. Чтобы установить с CocoaPods, следуйте разделу «Get Started» на [CocoaPods](https://cocoapods.org/).
#### Podfile

```ruby
use_frameworks!
pod 'InAppStory', :git => 'https://github.com/inappstory/ios-sdk.git'
```

#### Импорт библиотеки

##### Objective-C

```objective-c
#import <InAppStorySDK/InAppStorySDK.h>
```

##### Swift

```swift
import InAppStorySDK
```

## InAppStory
Основной синглтон класс для управления данными и кастомизации отображения списка и ридера
### Инициализация
Инициализацию библиотеки желатьельно проводить в `AppDelegate`: 

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool 
{
	InAppStory.shared.initWith(serviceKey: <String>, testKey: <String>, settings: <Settings?>, sandBox: <Bool?>)
	return true
}
```

* `serviceKey` - ключ авторизации в сервисе (\<*String*>); 
* `testKey ` - тестовый ключ авторизации в сервисе (\<*String*>);  
* `settings` - объект настроек (*<[Settings?](https://github.com/inappstory/ios-sdk#Settings)>* - *optional*);
* `sandBox` - сервер - Prod/Dev (\<*Bool?*> - *optional*).

### Методы
* `addTags(<Array<String>>)` - добавление тэгов;
* `removeTags(<Array<String>>)` - удаление тэгов;

### Параметры и свойства
* `onboardingDelegate` - должен реализовывать протокол *<[OnboardingDelegate](https://github.com/inappstory/ios-sdk#OnboardingDelegate)>*;
* `singleStoryDelegate` - должен реализовывать протокол *<[SingleStoryDelegate](https://github.com/inappstory/ios-sdk#SingleStoryDelegate)>*;
* `favoritesCount` - количество избранных сториз у пользователя
* `isLoggingEnabled` - вывод в консоль запросов к серверу

### Кастомизация
Настройка внешнего вида ячеек и ридера происходит через синглтон класса `InAppStory.shared`:
#### Список
* `showCellTitle` - отображения заголовков сторис в ячейке *\<Bool>*;
* `cellFont` - шрифт заголовка ячейки *\<UIFont>*;
* `cellTitleColor` - цвет заголовка ячейки *\<UIColor>*;
* `showCellSource` - отображение источника сторис *\<Bool>*;
* `cellSourceFont` - шрифт источника сторис *\<UIFont>*;
* `cellSourceTitleColor` - шрифт источника сторис *\<UIColor>*;
* `cellBorderColor` - цыет рамки ячейки *\<UIColor>*;

#### Ридер
* `swipeToClose` - закрытие ридера по свайпу *\<Bool>*;
* `overScrollToClose` - закрытия рида при пролистывании последней сторис *\<Bool>*;
* `placeholderElementColor` - цвет предзагрузчика слайда *\<UIColor>*;
* `placeholderBackgroundColor` - цвет фона предзагрузчика слайда *\<UIColor>*;
* `muted` - отключение/влючение звука в сторис *\<Bool>*; (*[Подробнее](Samples/Sound.md)*)
* `likePanel` - отображение нижней панели с лайками (должно быть включенов в консоли) *\<Bool>*;
* `favoritePanel` - отображение нижней панели с избранным (должно быть включенов в консоли) *\<Bool>*;
* `sharePanel` - отображение нижней панели с шарингом (должно быть включенов в консоли) *\<Bool>*;
* `likeImage` - изображения для кнопки лайка *\<UIImage>*;
* `likeSelectedImage` - изображения для выделеной кнопки лайка *\<UIImage>*;
* `dislikeImage` - изображения для кнопки дизлайка *\<UIImage>*;
* `dislikeSelectedImage` - изображения для выделеной кнопки дизлайка *\<UIImage>*;
* `favoriteImage` - изображения для кнопки избранного *\<UIImage>*;
* `favoriteSelectedImag` - изображения для выделеной кнопки избранного *\<UIImage>*;
* `shareImage` - изображения для кнопки шаринга *\<UIImage>*;
* `shareSelectedImage` - изображения для выделеной кнопки шаринга *\<UIImage>*;
* `placeholderView` - кастомный загрузчик, должен реализовывать протокол *<[PlaceholderProtocol](https://github.com/inappstory/ios-sdk#PlaceholderProtocol)>*;
* `closeButtonPosition` - положения кнопки закрытия относительно таймеров *<[ClosePosition](https://github.com/inappstory/ios-sdk#ClosePosition)>*;
* `scrollStyle` - стиль переходов между слайдами *<[ScrollStyle](https://github.com/inappstory/ios-sdk#ScrollStyle)>*;
* `presentationStyle` - стиль появления ридера *<[PresentationStyle](https://github.com/inappstory/ios-sdk#PresentationStyle)>*;

## StoryView
Основной класс для работы со списками сторис
### Инициализация
---
**Примечание**  
Если не был задан параметр *settings* у `InAppStory`, перед инициализацией `StoryView`, его необходимо задать:

```swift
InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>?>)
```
---

Параметр `favorite: <Bool?>` служит для отображении ленты сториз или экрана избранного 

```swift
var storyView: StoryView!
    
override func viewDidLoad() {
	super.viewDidLoad()
	
   	storyView = StoryView(frame: <CGRect>, favorite: <Bool?>)
	storyView.target = <UIViewController>
        
	view.addSubview(storyView)
        
	storyView.create()
}
```
### Методы
* `create` - запускает открытие сессии и получения списка сторис;
* `refresh` - служит для обновления списка сторис;
* `clear` - служит для очистки кэша изображений;
* `closeStory(complete: () -> Void)` - служит для закрытия ридера сторис, `complete` вызывается после закрытия ридера.

### Параметры и свойства
* `delegate` - должен реализовывать протокол *<[StoryViewDeleagate](https://github.com/inappstory/ios-sdk#StoryViewDeleagate)>*;
* `deleagateFlowLayout` - должен реализовывать протокол *<[StoryViewDeleagateFlowLayout](https://github.com/inappstory/ios-sdk#StoryViewDeleagateFlowLayout)>*;
* `tags` - список тэгов, для фильтрации контента *\<Array\<String>>*;
* `target` - контроллер для отображения ридера *\<UIViewController>*;
* `isContent` - отслеживание наполнения списка сторис *\<Bool>*;
* `storyCell` - кастомная ячейка, должена реализовывать протокол *<[StoryCellProtocol](https://github.com/inappstory/ios-sdk#StoryCellProtocol)>*;
* `favoriteCell` - кастомная ячейка избранного, должена реализовывать протокол *<[FavoriteCellProtocol](https://github.com/inappstory/ios-sdk#FavoriteCellProtocol)>*;

## OnboardingStory
Онбординг используются для отображения сторис не представленных в основном списке
### Отображение
---
**Примечание**  
Если перед показом онбординг сторис не был задан параметр *settings* у `InAppStory`, его необходимо задать:

```swift
InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>?>)
```
---

Для отображения показа онбординга необходимо задать делегат `onboardingDelegate` и вызвать метод у синглтон класса `InAppStory.shared`:

```swift
InAppStory.shared.showOnboarding(from target: <UIViewController>, delegate: <OnboardingDelegate>, complete: <()->Void>)
```

Для закрытия ридера онбординга необходимо вызвать `closeOnboarding(complete: () -> Void)`. Это может понадобиться, например, при обработки открытия ссылки по нажатию кнопки. `complete` вызывается после закрытия ридера.

## SingleStory
Используются для отображения сторис по её id или слагу
### Отображение
---
**Примечание**  
Если перед показом единичной сторис не был задан параметр *settings* у `InAppStory`, его необходимо задать:

```swift
InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>?>)
```
---

Для отображения показа онбординга необходимо задать делегат `singleStoryDelegate ` и вызвать метод у синглтон класса `InAppStory.shared`:

```swift
InAppStory.shared.showSingleStory(from target: <UIViewController>, with id: <String>, delegate: <SingleStoryDelegate>, complete: <()->Void>)
```

Для закрытия ридера единичной сторис необходимо вызвать `closeSingleStory(complete: () -> Void)`. Это может понадобиться, например, при обработки открытия ссылки по нажатию кнопки. `complete` вызывается после закрытия ридера.

## Протоколы

### StoryViewDeleagate

* `storyViewUpdated(storyView: <StoryView>)` - вызывается при обновлении списка;
* `storyView(_ storyView: <StoryView>, getLinkWith target: <String>)` - вызывается при получении ссылки из сторис;
* `storyReaderWillShow()` - вызывается перед открытием ридера сторис;
* `storyReaderDidClose()` - вызывается после закрытия ридера сторис;
* `favoriteCellDidSelect()` - вызывается при нажатии на ячейку избранного;
    
    
### StoryViewDeleagateFlowLayout

* `sizeForItemAt() -> <CGSize>` - возвращает размер ячейки для списка;
* `insetForSection() -> <UIEdgeInsets>` - возвращает отступы от краёв списка для ячеек;
* `minimumLineSpacingForSection() -> <CGFloat>` - возвращает отступы по вертикали между ячейками в списке;
* `minimumInteritemSpacingForSection() -> <CGFloat>` - возвращает отступы по горизонтали между ячеками в списке;

### OnboardingDelegate

* `onboardingUpdated(isContent: <Bool>)` - вызывается при получении списка сторис;
* `onboarding(getLinkWith target: <String>)` - вызывается при получении ссылки из сторис;
* `onboardingReaderWillShow()` - вызывается перед открытием ридера сторис;
* `onboardingReaderDidClose()` - вызывается после закрытия ридера сторис;

### SingleStoryDelegate

* `singleStoryUpdated(isContent: <Bool>)` - вызывается при получении единичной сторис;
* `singleStory(getLinkWith target: <String>)` - вызывается при получении ссылки из сторис;
* `singleStoryReaderWillShow()` - вызывается перед открытием ридера сторис;
* `singleStoryReaderDidClose()` - вызывается после закрытия ридера сторис;

### PlaceholderProtocol  
* `isAnimate: Bool { get }` - возвращает состояние анимации

---
* `start` - запуск анимации
* `stop` - остановка анимации

### StoryCellProtocol

* `reuseIdentifier: <String> { get }` - возвращает идентификатор ячейки;
* `nib: <UINib?> { get }` - возвращает nib визуального представления ячейки;  

---
* `setTitle(_ text: <String>)` - заголовок сторис;
* `setSource(_ text: <String>)` - источник сторис;
* `setImageURL(_ url: <URL>)` - адрес картинки для ячейки;
* `setVideoURL(_ url: <URL>)` - адрес видео для ячейки;
* `setOpened(_ value: <Bool>)` - открывалась ли сторис;
* `setHighlight(_ value: <Bool>)` - зажатие ячейки из списка;
* `setBackgroundColor(_ color: <UIColor>)` - цвет фона ячейки, если картинка не задана;
* `setTitleColor(_ color: <UIColor>)` - цвет заголовка сторис;

### FavoriteCellProtocol

* `reuseIdentifier: <String> { get }` - возвращает идентификатор ячейки;
* `nib: <UINib?> { get }` - возвращает nib визуального представления ячейки;  

* `favoritesCount: Int { get set }` - общее колличество сторис в избранном;

---
* `setHighlight(_ value: <Bool>)` - зажатие ячейки из списка;
* `setImages(_ urls: <Array<URL?>>)` - список адресов картинок первых четырёх избранных сторис;
* `setImagesColors(_ colors: <Array<UIColor?>>)` - список фоновых цветов первых четырёх избранных сторис;
* `setBackgroundColor(_ color: <UIColor>)` - общий фон ячейки;


## enum

### ScrollStyle
Стиль перелистывания сторис в ридере:  
* `.flat` - обычноеб друг за другом;
* `.cover` - с накрытием следующим слайдом;
* `.cube` - в виде трёхмерного куба;


### PresentationStyle
Стиль анимации отображения ридера:
* `.crossDissolve` - проявление ридера из прозрачности;
* `.modal` - выезжание рида из под нижнего края экрана;

### ClosePosition
Позиция кнопки закрыть на карточке в ридер
* `.left` - слева от таймеров;
* `.right` - справа от таймеров;
* `.bottomLeft` - слева под таймерами;
* `.bottomRight` - справа под таймерами;

## Объекты
### Settings

#### Параметры
* `userID` - уникальный идентификатор пользователя;
* `testKey` - тестовый ключ, для отображения не опубликованых сторис;

## NotificationCenter

### События
Во всех событиях, кроме `StoriesLoaded`, в `userInfo` передаются `id`, `title`, `tags`, `slidesCount`

* `StoriesLoaded` - список сториз загрузился, виджет готов к работе (срабатывает каждый раз при загрузке списка, в том числе и при refresh). В `userInfo` только count - количество сториз.
* `ClickOnStory` - клик по сториз в списке (доп параметр `source`)
* `ShowStory` - показ ридера со сториз (доп параметр `source`)
* `CloseStory` - закрытие сториз (доп параметры - `index`, `action`, `source`)
* `ClickOnButton` - клик по кнопке в сториз (доп параметры - `index`, `link`)
* `ShowSlide` - показ слайда (доп параметр - `index`)
* `LikeStory` - лайк сториз (доп параметры - `index`, `value`)
* `DislikeStory` - дизлайк сториз (доп параметры - `index`, `value`)
* `FavoriteStory` - добавление сториз в избранное (доп параметры - `index`, `value`)
* `ClickOnShareStory` - нажатие на кнопку поделиться (доп параметр - `index`)

### Ошибки
В уведомлениях об ошибке так же приходит `userInfo` в виде словаря `["errorMessage" : <Error_message_string>]`

* `SessionFailure` - ошибка при работе с сессией
* `StoryFailure` - ошибка при работе с сторис
* `CurrentStoryFailure` - ошибка при загрузке полной информации по сторис
* `NetworkFailure` - ошибка при работе сетью (нет интернета)

