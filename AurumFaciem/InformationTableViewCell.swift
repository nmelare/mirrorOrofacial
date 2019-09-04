//
//  InformationTableViewCell.swift
//  AurumFaciem
//
//  Created by Nathalia Melare on 03/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLesson: UILabel!
    @IBOutlet weak var playImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
