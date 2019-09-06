//
//  TreinoCollectionViewCell.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 01/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class TreinoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12.0
        self.clipsToBounds = true
    }

}
