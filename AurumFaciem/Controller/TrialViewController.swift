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

    @IBOutlet weak var progressBar: ProgressBar!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var videoView: VideoView!
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
    var index = 0
    let videosAmount = 10
    let buttonColor: UIColor = #colorLiteral(red: 0.9215686275, green: 0.568627451, blue: 0.4745098039, alpha: 1)

    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        super.viewDidLoad()
        loadTrial()
    }
    @IBAction func button1Click(_ sender: Any) {
        if button1.titleLabel?.text != nil {
            checkResponse(sender: button1)
        }
    }
    @IBAction func button2Click(_ sender: Any) {
        if button2.titleLabel?.text != nil {
            checkResponse(sender: button2)
        }
    }
    @IBAction func button3Click(_ sender: Any) {
        if button3.titleLabel?.text != nil {
            checkResponse(sender: button3)
        }
    }
    @IBAction func button4Click(_ sender: Any) {
        if button4.titleLabel?.text != nil {
            checkResponse(sender: button4)
        }
    }

    func takeRandomString (from array: inout [String]) -> String {
        var palavra = ""
        if let random = array.randomElement() {
            palavra = random
            if let index = array.firstIndex(of: random) {
                array.remove(at: index)
            }
        } else {
            print ("Couldn't get random element from array in method takeRandomString()")
        }
        return palavra
    }

    func checkResponse(sender: UIButton) {
        if sender.titleLabel?.text == chosenWord {
            loadTrial()
            index += 1
            progressBar.setProgress(CGFloat(index)/CGFloat(videosAmount))
        } else {
            sender.backgroundColor = .gray
        }
    }

    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func loadTrial() {
        var palavrasRestantes = palavras
        chosenWord = takeRandomString(from: &palavrasRestantes)
        let buttons = [ button1, button2, button3, button4 ]
        for btn in buttons {
            btn?.backgroundColor = buttonColor
            btn?.setTitle("Button", for: UIControl.State.normal)
        }
        let chosenB = Int.random(in: 0...3)
        buttons[chosenB]?.setTitle(chosenWord, for: UIControl.State.normal)
        print("chosen word: \(chosenWord)")
        for btn in buttons where btn != buttons[chosenB] {
            btn?.setTitle(takeRandomString(from: &palavrasRestantes), for: UIControl.State.normal)
        }
        if let videoURL = Bundle.main.path(forResource: "IMG_0711.TRIM", ofType: "MOV") {
            videoView.configure(url: videoURL)
            videoView.play()
            NotificationCenter.default.addObserver(videoView, selector: #selector(videoView.reachTheEndOfTheVideo(_:)),
                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                   object: self.videoView.player?.currentItem)
        } else {
            print ("Couldn't load video")
        }
    }
}
