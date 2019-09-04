//
//  BibliotecaTableViewCell.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 01/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class BibliotecaTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.tintColor = .blue
        self.backgroundColor = .gray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
