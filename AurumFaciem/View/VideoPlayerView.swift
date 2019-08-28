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
class VideoPlayerView : UIView {
    
    var player : AVPlayer?
    var playerLayer : AVPlayerLayer?
    
    func configure(url: String) {
        guard let videoURL = URL(string: url) else {
            print("url returned nil!")
            return
        }
        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer!.frame = bounds
        playerLayer!.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer!)
        NotificationCenter.default.addObserver(self, selector: #selector(reachedEndOfVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
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
