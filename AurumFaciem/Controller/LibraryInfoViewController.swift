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
    var explicativeText: [String] = ["zero","um","dois","tres","quatro","cinco","seis","sete","oito","nove","dez","onze"]

    @IBOutlet weak var video: UIView!
    @IBOutlet weak var lastInfoImage: UIImageView!
    @IBOutlet weak var newInfoImage: UIImageView!
    @IBOutlet weak var closeButton: UIButton!

    @IBAction func closeButton(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var informationVideo: UILabel!

    @IBAction func lastInformationButton(_ sender: UIButton) {
        if index != 0 {
            index -= 1
        }
        load()
     }
    @IBOutlet weak var lastInformationButton: UIButton!

    @IBAction func newInformationButton(_ sender: UIButton) {
        if index != 10 {
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
        newInformationButton.isHidden = (index == 10) ? true : false
        newInfoImage.isHidden  = (newInformationButton.isHidden == true) ? true : false
        lastInfoImage.isHidden = (lastInformationButton.isHidden == true) ? true : false
        informationVideo.text = explicativeText[index]
        lastInformationButton.setTitle((index == 0) ? nil : explicativeText[index - 1], for: .normal)
        newInformationButton.setTitle((index == 10) ? nil : explicativeText[index + 1], for: .normal)
    }
}
