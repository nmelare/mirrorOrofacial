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
        self.backgroundColor = .white
        self.textLabel?.textColor = #colorLiteral(red: 0.2509803922, green: 0.2392156863, blue: 0.3450980392, alpha: 1)
        self.accessoryView = UIImageView(image: UIImage(named: "Chevron"))
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
