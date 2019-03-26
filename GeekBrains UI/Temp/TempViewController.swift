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
    
    
    @IBAction func tap(_ sender: Any) {
        
        performSegue(withIdentifier: "goToBlueVC", sender: self)
    }
}

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        guard let containerView = source.view.superview else { return }
        let sourceVC = source
        let destinationVC = destination
        
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: sourceVC.view.frame.height,
                                           width: sourceVC.view.frame.width,
                                           height: sourceVC.view.frame.height)
        let destinationViewTargetFrame = sourceVC.view.frame
        
        
        containerView.addSubview(destinationVC.view)
        
        destinationVC.view.frame = CGRect(x: 0,
                                          y: -destinationVC.view.frame.height,
                                          width: destinationVC.view.frame.width,
                                          height: destinationVC.view.frame.height)
        
        
        UIView.animate(withDuration: 5, animations: {
            sourceVC.view.frame = sourceViewTargetFrame
            destinationVC.view.frame = destinationViewTargetFrame
        }, completion: { finished in
            self.source.present(self.destination, animated: false, completion: nil)
        })

    }
}



//class AnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 5.0
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard let sourceVC = transitionContext.viewController(forKey: .from),
//              let destinationVC = transitionContext.viewController(forKey: .to)
//        else {
//            return
//        }
//
//        let sourceViewTargetFrame = CGRect(x: 0,
//                                           y: sourceVC.view.frame.height,
//                                           width: sourceVC.view.frame.width,
//                                           height: sourceVC.view.frame.height)
//        let destinationViewTargetFrame = sourceVC.view.frame
//
//
//        transitionContext.containerView.addSubview(destinationVC.view)
//
//        destinationVC.view.frame = CGRect(x: 0,
//                                          y: -destinationVC.view.frame.height,
//                                          width: destinationVC.view.frame.width,
//                                          height: destinationVC.view.frame.height)
//
//
//        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
//            sourceVC.view.frame = sourceViewTargetFrame
//            destinationVC.view.frame = destinationViewTargetFrame
//        }, completion: { finished in
//            transitionContext.completeTransition(finished)
//        })
//    }
//}
