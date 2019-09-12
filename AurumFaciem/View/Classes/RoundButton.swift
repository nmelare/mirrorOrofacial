//
//  RoundButton.swift
//  AurumFaciem
//
//  Created by Alex Nascimento on 02/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    let cornerRadius: CGFloat = 12

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = self.cornerRadius
        self.clipsToBounds = true
    }
}
