//
//  LibraryInfoViewController.swift
//  AurumFaciem
//
//  Created by Nathalia Melare on 30/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit
import Foundation

class LibraryInfoViewController: UIViewController {

    var index: Int = 0
    var videosAmount: Int
    var explicativeText: [CDVideo]
    var categoria: CDCategory
    var CDAccess: DAOCoordinator

    init(nibName nibNameOrNil: String?,
         bundle nibBundleOrNil: Bundle?,
         category: CDCategory,
         CDAccess: DAOCoordinator) {
        self.categoria = category
        self.CDAccess = CDAccess
        guard let videos1 = category.videos?.array as? [CDVideo] else {
            fatalError("Biblioteca falhou em iniciar")
        }
        self.explicativeText = videos1
        self.videosAmount = videos1.count
        super.init(nibName: nibNameOrNil,
                   bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var video: VideoView!
    @IBOutlet weak var lastInfoImage: UIImageView!
    @IBOutlet weak var newInfoImage: UIImageView!
    @IBOutlet weak var closeButton: UIButton!

    @IBAction func closeButton(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var informationVideo: UILabel!

    @IBAction func lastInformationButton(_ sender: UIButton) {
        if index > 0 {
            index -= 1
        }
        load()
     }
    @IBOutlet weak var lastInformationButton: UIButton!

    @IBAction func newInformationButton(_ sender: UIButton) {
        if index <= videosAmount - 1 {
            index += 1
        }
        load()
    }
    @IBOutlet weak var newInformationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }

    func load() {
        lastInformationButton.isHidden = (index == 0) ? true : false
        newInformationButton.isHidden = (index == videosAmount - 1) ? true : false
        informationVideo.text = explicativeText[index].word ?? "<ERRO AO RECUPERAR PALAVRAS>"
        lastInformationButton.setTitle((index == 0) ? nil : explicativeText[index - 1].word, for: .normal)
        newInformationButton.setTitle((index == videosAmount - 1) ? nil : explicativeText[index + 1].word, for: .normal)
        newInfoImage.isHidden  = newInformationButton.isHidden
        lastInfoImage.isHidden = lastInformationButton.isHidden
        video.setVideo(url: explicativeText[index].path ??
            URL(fileURLWithPath: Bundle.main.path(forResource: "IMG_0711.TRIM",
                                                  ofType: "mp4") ?? ""))
    }
}
