//
//  TViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 09/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class TViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tempView: AvatarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tempView.image = #imageLiteral(resourceName: "006-tornado")
    }
}

