//
//  ProgressBar.swift
//  AurumFaciem
//
//  Created by Alex Nascimento on 02/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class ProgressBar: UIView {

    
    
    var progressColor: UIColor = #colorLiteral(red: 0.4, green: 0.8431372549, blue: 0.8196078431, alpha: 1)
    var cornerRadius: CGFloat = 12
    
    var progress: CGFloat = 0 { // value between 0.0 and 1.0
        didSet {
            draw(self.frame)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .white
        super.draw(rect)
        layer.cornerRadius = self.cornerRadius
        clipsToBounds = true
        
        var path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: progress * self.frame.width, height: self.frame.height))
        progressColor.setFill()
        path.fill()
    }
}
