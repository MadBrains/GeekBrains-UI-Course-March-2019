//
//  RedViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 26/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func tap(sender: UIButton) {
        dismiss(animated: true)
    }
}
