//
//  TempView.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    
    @IBInspectable var tempColor: UIColor = UIColor.red
    @IBInspectable var tempFloat: CGFloat = 1.0
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private var imageView: UIImageView!
    
    @IBInspectable var shadowOffset: CGSize = CGSize.zero
    @IBInspectable var shadowOpacity: Float = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView = UIImageView(frame: bounds)
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        layer.cornerRadius = bounds.width / 2
        imageView.layer.cornerRadius = bounds.width / 2
    }
    
    
}
