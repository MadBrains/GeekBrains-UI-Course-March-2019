//
//  TempView.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 23/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class TempView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 40, y: 20))
        path.addLine(to: CGPoint(x: 45, y: 40))
        path.addLine(to: CGPoint(x: 65, y: 40))
        path.addLine(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 60, y: 70))
        path.addLine(to: CGPoint(x: 40, y: 55))
        path.addLine(to: CGPoint(x: 20, y: 70))
        path.addLine(to: CGPoint(x: 30, y: 50))
        path.addLine(to: CGPoint(x: 15, y: 40))
        path.addLine(to: CGPoint(x: 35, y: 40))
        path.close()
        path.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 3
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.fillColor = UIColor.green.cgColor
        layer.addSublayer(shapeLayer)

        
//        let pathAnimation = CABasicAnimation(keyPath: "strokeStart")
//        pathAnimation.fromValue = 0
//        pathAnimation.toValue = 1
//
//        let pathAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
//        pathAnimationEnd.fromValue = 0
//        pathAnimationEnd.toValue = 1.2
//
//        let group = CAAnimationGroup()
//        group.duration = 3
//        group.animations = [pathAnimation, pathAnimationEnd]
//        group.repeatCount = Float.infinity
//
//        shapeLayer.add(group, forKey: nil)
//
//
//
        
        
        
        
    }

}
