# Видео обложки ячеек
Попмимо изображений обложек для ячейки от библиотеки может приходить видео. После кастомизации ячейки с помощью протокола `StoryCellProtocol` (описание в разделе [Кастомизация ячейки](CustomCell.md)), необходимо реализвать работу с видео, если необходимо.  
>**Обратите внимание**  
>Кэширование видео обложек ячеек, происходит средствами библиотеки и в реализацию метода `setVideoURL(_ url: URL)` приходит адрес на файл из кэша.  

#### Пример реализации ячейки с видео
##### CustomStoryCell.swift
```swift
import AVFoundation

class CustomStoryCell: UICollectionViewCell 
{
    ...
    fileprivate let player = AVPlayer()
    fileprivate var playerLayer: AVPlayerLayer!
    
    // контейнер для видео
    @IBOutlet weak var videoView: UIView!
    ...

    override func prepareForReuse() {
        super.prepareForReuse()
        
        ...
        // при переиспользовании ячейки контейнер скрывается
        videoView.isHidden = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
            
        // создание слоя видеоплеера и добавление его в контейнер
        if playerLayer == nil {
            player.isMuted = true
            playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = videoView.frame
            playerLayer.videoGravity = .resizeAspectFill
            videoView.layer.addSublayer(playerLayer)
        }
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        // обновление размеров слоя видеоплеера
        if playerLayer != nil {
            playerLayer.frame = videoView.frame
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// реализация протокола StoryCellProtocol
extension CustomStoryCell: StoryCellProtocol
{
    ...
    func setVideoURL(_ url: URL) {
        // установка нового элемента в проигрыватель по url
        player.replaceCurrentItem(with: AVPlayerItem(url: url))

        // создание обработчика события на перезапуск проигрывания
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { [weak self] _ in
            guard let weakSelf = self, !weakSelf.videoView.isHidden else {
                return
            }
    
            weakSelf.player.seek(to: CMTime.zero)
            weakSelf.player.play()
        }
        
        // запуск проигрывания
        player.play()
        
        // отображение контейнера в ячейке
        videoView.isHidden = false
    }
    ...
}
```