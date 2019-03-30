//
//  TempHeader.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 30/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class TempHeader: UITableViewHeaderFooterView {

    let label = UILabel(frame: CGRect.zero)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

}
