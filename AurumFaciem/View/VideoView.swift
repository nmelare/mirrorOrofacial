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

    var reloadButton: UIButton!
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    let cornerRadius: CGFloat = 12
    var greyView: UIView!

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = self.cornerRadius
        clipsToBounds = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        greyView = UIView(frame: self.bounds)
        greyView.backgroundColor = #colorLiteral(red: 0.2335334718, green: 0.2321515977, blue: 0.2345997691, alpha: 0.5)
        self.addSubview(greyView)
        greyView.isHidden = true
        reloadButton = UIButton(frame: self.bounds)
        reloadButton.addTarget(self, action: #selector(reloadVideo(_:)), for: .touchUpInside)
        reloadButton.setImage(UIImage(named: "Player"), for: UIControl.State.normal)
        reloadButton.imageView?.contentMode = .scaleAspectFill
        self.addSubview(reloadButton)
        reloadButton.isHidden = true
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

    @objc func reloadVideo(_ sender: Any) {
        self.player?.seek(to: CMTime.zero)
        self.player?.play()
        reloadButton.isHidden = true
        greyView.isHidden = true
    }

    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        self.reloadButton.isHidden = false
        greyView.isHidden = false
    }
}
