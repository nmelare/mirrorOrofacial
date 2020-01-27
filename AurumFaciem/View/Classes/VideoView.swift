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

    var reloadButton: UIButton?
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    let cornerRadius: CGFloat = 12
    var greyView: UIView?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = self.cornerRadius
        clipsToBounds = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.greyView = UIView(frame: self.bounds)
        self.reloadButton = UIButton(frame: self.bounds)

        guard let greyView = self.greyView, let reloadButton = self.reloadButton else {
            fatalError("VideoView failed to create greyView and reloadButton")
        }

        greyView.backgroundColor = #colorLiteral(red: 0.2335334718, green: 0.2321515977, blue: 0.2345997691, alpha: 0.5)
        greyView.isHidden = true

        reloadButton.addTarget(self, action: #selector(reloadVideo(_:)), for: .touchUpInside)
        reloadButton.setImage(UIImage(named: "WhitePlayer"), for: UIControl.State.normal)
        reloadButton.imageView?.contentMode = .scaleAspectFill
        reloadButton.isHidden = true

        self.addSubview(greyView)
        self.addSubview(reloadButton)
    }

    private func configure(url: URL) {
            player = AVPlayer(url: url)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.frame = bounds
            playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            playerLayer?.zPosition = -1
            if let playerLayer = self.playerLayer {
                layer.addSublayer(playerLayer)
            }
    }

    private func play() {
        if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
            player?.play()
            toggleReloadAndGrey(true)
        }
    }

    private func pause() {
        player?.pause()
    }

    private func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
    }

    func setVideo(url: URL) {
        configure(url: url)
        player?.play()
        player?.seek(to: CMTime.zero)
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachTheEndOfTheVideo(_:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: self.player?.currentItem)
        toggleReloadAndGrey(true)
    }

    @objc func reloadVideo(_ sender: Any) {
        self.player?.seek(to: CMTime.zero)
        self.player?.play()
        toggleReloadAndGrey(true)
    }

    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        print("end of video")
        toggleReloadAndGrey(false)
    }
    
    func toggleReloadAndGrey(_ toggle: Bool) {
        guard let greyView = self.greyView, let reloadButton = self.reloadButton else {
            fatalError("VideoView failed to create greyView and reloadButton")
        }
        reloadButton.isHidden = toggle
        greyView.isHidden = toggle
    }
}
