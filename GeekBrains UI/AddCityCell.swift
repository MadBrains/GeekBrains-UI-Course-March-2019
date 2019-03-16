//
//  AddCityCell.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 12/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class AddCityCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    var addCityTaped: ((String) -> Void)?
    
    @IBAction func addCity(_ sender: Any) {
        addCityTaped?(cityLabel.text!)
    }
    
}
