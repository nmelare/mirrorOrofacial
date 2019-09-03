//
//  VideoView.swift
//  AurumFaciem
//
//  Created by Alex Nascimento on 30/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoView: UIView {

    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    var isLoop: Bool = false
    
    let cornerRadius: CGFloat = 12

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = self.cornerRadius
        clipsToBounds = true
    }

    func configure(url: String) {
            player = AVPlayer(url: URL(fileURLWithPath: url))
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.frame = bounds
            playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            playerLayer?.zPosition = -1
            if let playerLayer = self.playerLayer {
                layer.addSublayer(playerLayer)
            }
    }

    func play() {
        if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
            player?.play()
        }
    }

    func pause() {
        player?.pause()
    }

    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
    }
}
