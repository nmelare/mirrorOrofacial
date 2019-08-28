//
//  ViewController.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 27/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class TrialViewController: UIViewController {

    @IBOutlet weak var videoPlayer: VideoPlayerView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    var palavras = ["abacaxi", "leao", "orangotanto", "faisca",
                    "tubarao", "navio", "pavio", "pavao", "latao",
                    "carro", "barco", "farpa", "carpa", "mapa",
                    "rasgo", "marca", "jogo", "modo", "foco",
                    "fogo", "folga"]
    var palavraEscolhida: String = ""
    override func viewDidLoad() {
        var palavrasRestantes = palavras
        super.viewDidLoad()
        print(palavrasRestantes)
        palavraEscolhida = takeRandomString(from: &palavrasRestantes)
        print(palavraEscolhida)
        button1.setTitle(takeRandomString(from: &palavrasRestantes), for: UIControl.State.normal)
        button2.setTitle(takeRandomString(from: &palavrasRestantes), for: UIControl.State.normal)
        button3.setTitle(takeRandomString(from: &palavrasRestantes), for: UIControl.State.normal)
        button4.setTitle(takeRandomString(from: &palavrasRestantes), for: UIControl.State.normal)
        print(palavrasRestantes)
        
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
}
