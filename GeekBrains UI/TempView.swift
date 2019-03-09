//
//  TempView.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class TempView: UIView {
    
    @IBInspectable var tempColor: UIColor = UIColor.red
    @IBInspectable var tempFloat: CGFloat = 1.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.setFillColor(tempColor.cgColor)
        context.move(to: CGPoint(x: 40, y: 20))
        context.addLine(to: CGPoint(x: 45, y: 40))
        context.addLine(to: CGPoint(x: 65, y: 40))
        context.addLine(to: CGPoint(x: 50, y: 50))
        context.addLine(to: CGPoint(x: 60, y: 70))
        context.addLine(to: CGPoint(x: 40, y: 55))
        context.addLine(to: CGPoint(x: 20, y: 70))
        context.addLine(to: CGPoint(x: 30, y: 50))
        context.addLine(to: CGPoint(x: 15, y: 40))
        context.addLine(to: CGPoint(x: 35, y: 40))
        context.closePath()
        context.fillPath()
    }
    
}
