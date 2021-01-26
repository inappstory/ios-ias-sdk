# Управление звуком

В сторис могут быть видео для которых включена функция воспроизведения со звуком. Для таких карточек в нижней панели отображается кнопка переключения звука. По умолчанию воспроизведение звука отключено

### Кастомизация кнопки

Для изменения иконок кнопки звука необходимо у `InAppStory` задать изображения в пераметрах `soundImage` и `soundSelectedImage`

##### AppDelegate.swift
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
{
    //инициализация библиотеки
    InAppStory.shared.initWith(serviceKey: <String>, sandBox: Bool)
    
    // настроки так же можно указать в любой момент до создания StoryView или вызова отдельных сторис 
    InAppStory.shared.settings = Settings(userID: <String>, tags: <Array<String>>)
    
    // Изменение иконок звука
    InAppStory.shared.soundImage = <UIImage> // Звук включён
    InAppStory.shared.soundSelectedImage = <UIImage> // Звук отключён
    
    return true
}
```

### Управление

По умолчанию звук в сторис выключен, это можно изменить, если задать `InAppStory` параметр `muted` с необходимым значением.

##### ViewController.swift
```swift
...

func changeSound(value: Bool) {
    InAppStory.shared.muted = value
}
...
```  

---
**Примечание**  
Если задать `muted` во время того как открыта сторис со звуком, воспроизведение остановится или запустится, в зависимости от переданного значения.  
Таким образом можно управлять звуком из приложения в которое встроенна библиотека.

---
