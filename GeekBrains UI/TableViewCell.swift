//
//  TableViewCell.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 16/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let temp = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        temp.backgroundColor = .red
        addSubview(temp)
    }

}
