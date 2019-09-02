//
//  ViewController.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 27/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit
import AVFoundation

class TrialViewController: UIViewController {

    @IBOutlet weak var videoView: VideoView!
    @IBOutlet weak var reloadBtn: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    var palavras = ["abacaxi", "leao", "orangotanto", "faisca",
                    "tubarao", "navio", "pavio", "pavao", "latao",
                    "carro", "barco", "farpa", "carpa", "mapa",
                    "rasgo", "marca", "jogo", "modo", "foco",
                    "fogo", "folga"]
    var chosenWord: String = ""

    override func viewDidLoad() {
        let libraryViewController = LibraryInfoViewController(nibName: "LibraryInfoViewController", bundle: nil)
        present(libraryViewController, animated: false, completion: nil)
        var palavrasRestantes = palavras
        super.viewDidLoad()
        chosenWord = takeRandomString(from: &palavrasRestantes)
        var buttons = [ button1, button2, button3, button4 ]
        let chosenB = Int.random(in: 1...4)
        switch chosenB {
        case 1: button1.setTitle(chosenWord, for: UIControl.State.normal)
        case 2: button2.setTitle(chosenWord, for: UIControl.State.normal)
        case 3: button3.setTitle(chosenWord, for: UIControl.State.normal)
        case 4: button4.setTitle(chosenWord, for: UIControl.State.normal)
        default:
            print("switch exausted chosen word options")
        }
        print("chosen word: \(chosenWord)")
        for btn in buttons where btn?.titleLabel?.text == "Button" {
            btn?.setTitle(takeRandomString(from: &palavrasRestantes), for: UIControl.State.normal)
        }
        if let videoURL = Bundle.main.path(forResource: "IMG_0944", ofType: "MOV") {
            videoView.configure(url: videoURL)
            videoView.play()
            reloadBtn.isHidden = true
            NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)),
                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                   object: self.videoView.player?.currentItem)
        } else {
            print ("Nao pôde carregar video")
        }

    }

    func takeRandomString (from array: inout [String]) -> String {
        var palavra = ""
        if let random = array.randomElement() {
            palavra = random
            array.remove(at: array.firstIndex(of: random)!)
        } else {
            print ("Couldn't get random element from array in method takeRandomString()")
        }
        return palavra
    }
    
    @IBAction func reloadVideo(_ sender: Any) {
        videoView.player?.seek(to: CMTime.zero)
        videoView.player?.play()
        reloadBtn.isHidden = true
    }
    
    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        reloadBtn.isHidden = false
    }
}
