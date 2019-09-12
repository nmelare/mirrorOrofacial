//
//  ConfettiParticles.swift
//  AurumFaciem
//
//  Created by Alex Nascimento on 06/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class Particles {

    static func configureConfetti(emitterLayer: CAEmitterLayer) {
        let cell1 = Particles.makeCell(color: AppColor.aqua)
        let cell2 = Particles.makeCell(color: AppColor.orange)
        let cell3 = Particles.makeCell(color: AppColor.purple)
        let cell4 = Particles.makeCell(color: .white)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterSize = CGSize(width: 500, height: 1)
        emitterLayer.emitterCells = [cell1, cell2, cell3, cell4]
        emitterLayer.zPosition = 20
    }

    static func makeCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 400
        cell.emissionRange = .pi/8
        cell.emissionLongitude = 0
        cell.lifetime = 3
        cell.alphaSpeed = -0.2
        cell.spinRange = .pi/6
        cell.spin = .pi/4
        cell.velocity = 800
        cell.velocityRange = 1200
        cell.yAcceleration = 600
        cell.scale = 3.4
        cell.color = color.cgColor
        if let image = UIImage(named: "Square.png")?.cgImage {
            cell.contents = image
        }
        return cell
    }

    static func setupConfetti(confettiLayer: CAEmitterLayer, view: UIView) {
        Particles.configureConfetti(emitterLayer: confettiLayer)
        confettiLayer.beginTime = CACurrentMediaTime()
        confettiLayer.emitterPosition = CGPoint(x: view.frame.width/2, y: view.frame.height)
        confettiLayer.birthRate = 0
        view.layer.addSublayer(confettiLayer)
    }

    static func stopParticles(emitterLayer: CAEmitterLayer) {
        emitterLayer.birthRate = 0
    }

    static func startParticles(emitterLayer: CAEmitterLayer) {
        emitterLayer.beginTime = CACurrentMediaTime()
        emitterLayer.birthRate = 1
    }
}
