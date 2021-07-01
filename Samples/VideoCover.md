# Video cover

Covers for cells can be rendered as video.

After customizing a cell using `StoryCellProtocol` (description in the [Cell customization](CustomCell.md) section), you need to implement work with video, if necessary. 

>**Pay atantion** 
>Caching of video covers is carried out by means of the library and the address to the file (which located  in local storage) comes to the implementation of the `setVideoURL(_ url: URL)` method.

#### Cover video example

##### CustomStoryCell.swift

```swift
import AVFoundation

class CustomStoryCell: UICollectionViewCell 
{
    ...
    fileprivate let player = AVPlayer()
    fileprivate var playerLayer: AVPlayerLayer!
    
    // video container
    @IBOutlet weak var videoView: UIView!
    ...

    override func prepareForReuse() {
        super.prepareForReuse()
        
        ...
        // when reusing a cell, the container is hidden
        videoView.isHidden = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
            
        // creating a video layer and adding it to the container
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
        
        // update the video layer size
        if playerLayer != nil {
            playerLayer.frame = videoView.frame
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// implementation of the StoryCellProtocol
extension CustomStoryCell: StoryCellProtocol
{
    ...
    func setVideoURL(_ url: URL) {
        // setting a new element to the player by url
        player.replaceCurrentItem(with: AVPlayerItem(url: url))

        // creating an event handler to loop video
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { [weak self] _ in
            guard let weakSelf = self, !weakSelf.videoView.isHidden else {
                return
            }
    
            weakSelf.player.seek(to: CMTime.zero)
            weakSelf.player.play()
        }
        
        // start playback
        player.play()
        
        // displaying a container in a cell
        videoView.isHidden = false
    }
    ...
}
```
