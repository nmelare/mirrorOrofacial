//
//  VideoPlayerView.swift
//  AurumFaciem
//
//  Created by Alex Nascimento on 28/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit
import AVFoundation

// code adapted from
// https://medium.com/@rodrigo_freitas/a-simple-ios-view-to-play-video-b7ee05f9ce6a

@IBDesignable
class VideoPlayerView: UIView {
    
    // xib and nib
    let nibName = "VideoPlayerView"
    var contentView: UIView?
    @IBOutlet weak var button: UIButton!
    @IBAction func click(_ sender: Any) {
        button.titleLabel?.text = "Click"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // video
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    func configure(url: String) {
        guard let videoURL = URL(string: url) else {
            print("url returned nil!")
            return
        }
        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        if let playerLayer = playerLayer {
            playerLayer.frame = bounds
            playerLayer.videoGravity = .resizeAspectFill
            layer.addSublayer(playerLayer)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(reachedEndOfVideo(_:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: self.player?.currentItem)
    }
    
    func play() {
        if player?.timeControlStatus != AVPlayer.TimeControlStatus.paused {
            player?.play()
        }
    }
    
    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
    }
    
    @objc func reachedEndOfVideo(_ notification: Notification) {
        // callback for when the video ends
    }
}
