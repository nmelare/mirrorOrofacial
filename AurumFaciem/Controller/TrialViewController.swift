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
    var palavras: [CDVideo] = []
    var categorias: [CDCategory]
    var chosenWord: String = ""
    var index = 0
    let videosAmount: Int
    var lesson: CDLesson
    var CDAccess: DAOCoordinator
    var confetti = CAEmitterLayer()
    var wonTrial = false

    init(nibName nibNameOrNil: String?,
         bundle nibBundleOrNil: Bundle?,
         lessonName: String,
         CDAccess: DAOCoordinator) {
        guard let lesson = CDAccess.lessonDAO.fetchByName(lessonName) else {
            fatalError("Treino falhou em iniciar")
        }
        self.lesson = lesson
        self.CDAccess = CDAccess
        guard let catigorias = lesson.categories?.allObjects as? [CDCategory] else {
            fatalError("Treino falhou em iniciar")
        }
        self.categorias = catigorias
        self.videosAmount = categorias.count
        super.init(nibName: nibNameOrNil,
                   bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        super.viewDidLoad()
        loadTrial()
        Particles.setupConfetti(confettiLayer: confetti, view: view)
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

    @IBAction func closePressed(_ sender: Any) {
        let alert = UIAlertController(title: "Certeza que quer sair?",
                                      message: "Você perderá todo seu progresso até agora.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Não", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

    func loadTrial() {
        guard let videos1 = categorias[index].videos?.array as? [CDVideo] else {
            fatalError("Treino falhou em iniciar")
        }
        palavras = videos1
        var palavrasRestantes: [String] = palavras.map { (video) -> String in
            return video.word ?? ""
        }
        chosenWord = takeRandomString(from: &palavrasRestantes)
        let buttons = [ button1, button2, button3, button4 ]
        for btn in buttons {
            btn?.backgroundColor = AppColor.orange
            btn?.setTitle("Button", for: UIControl.State.normal)
        }
        let chosenB = Int.random(in: 0...3)
        buttons[chosenB]?.setTitle(chosenWord, for: UIControl.State.normal)
        print("chosen word: \(chosenWord)")
        for btn in buttons where btn != buttons[chosenB] {
            btn?.setTitle(takeRandomString(from: &palavrasRestantes), for: UIControl.State.normal)
        }
        videoView.setVideo(url: CDAccess.videoDAO.fetchByWord(chosenWord)?.path ??
            URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_0711.TRIM",
                                                  ofType: "mp4") ?? ""))
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
        if wonTrial { return }
        if sender.titleLabel?.text == chosenWord {
            if index == videosAmount - 1 {
                // make particles
                Particles.startParticles(emitterLayer: confetti)
                _ = Timer.scheduledTimer(withTimeInterval: 0.5,
                                         repeats: false,
                                         block: { (_) in
                                            self.confetti.birthRate = 0
                                            _ = Timer.scheduledTimer(withTimeInterval: 2,
                                                                     repeats: false,
                                                                     block: { (_) in
                                                                        self.dismiss(animated: true,
                                                                                     completion: nil)
                                            })
                })
                wonTrial = true
                index += 1
            } else {
                loadTrial()
                index += 1
            }
            progressBar.setProgress(CGFloat(index)/CGFloat(videosAmount))
        } else {
            sender.backgroundColor = .gray
        }
    }

}
