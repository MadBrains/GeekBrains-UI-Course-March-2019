//
//  LikeView.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 30/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class LikeView: UIControl {

    let label = UILabel(frame: CGRect.zero)
    var likesCount = 0 {
        didSet {
            label.text = "Likes \(likesCount)"
        }
    }
    
    var onTap: (() -> Void)?
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        onTap?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
