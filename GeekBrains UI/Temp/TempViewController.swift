//
//  TempViewController.swift
//  GeekBrains UI
//
//  Created by Antol Peshkov on 23/03/2019.
//  Copyright © 2019 Mad Brains. All rights reserved.
//

import UIKit

class TempViewController: UIViewController {

    @IBOutlet weak var tempView: TempView!
    @IBOutlet weak var redView: UIView!
    
    var animator: UIViewPropertyAnimator?
    
    var friendList = [String]()
    var printFriendHeader = [String: [String]]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for friend in friendList {
            let letterString = String(friend.first!)
            var friendsArray = printFriendHeader[letterString] ?? []
            friendsArray.append(friend)
            printFriendHeader[letterString] = friendsArray
        }
        
//        animator = UIViewPropertyAnimator(duration: 6, curve: .linear) {
//            self.tempView.center.y += 200
//        }
//
//        animator?.startAnimation()
    }
    
    @IBAction func pause(_ sender: Any) {
//        animator?.pauseAnimation()
    }
    @IBAction func `continue`(_ sender: Any) {
//        animator?.continueAnimation(withTimingParameters: nil, durationFactor: 0)
    }
    @IBAction func stop(_ sender: Any) {
//        animator?.stopAnimation(false)
    }
    
    @IBAction func pan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 6, curve: .linear) {
                self.tempView.center.y += 400
            }
            animator?.pauseAnimation()
        case .changed:
            
            let translation = recognizer.translation(in: self.view)
            animator?.fractionComplete = translation.y / 300
            
        case .ended:
            animator?.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default: return
        }
    }
    
}
