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
    
    let interactive = CustomInteractiveTransition()
    
    @IBAction func tap(_ sender: Any) {
        navigationController?.delegate = self
        
        let newVC = RedViewController()
        interactive.viewController = newVC
        navigationController?.pushViewController(newVC, animated: true)
    }
}


extension TempViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimatedTransitioning()
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive.hasStarted ? interactive : nil
    }
}

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self,
                                                              action: #selector(handleScreenEdgeGesture(_:)))
            recognizer.edges = [.bottom]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var hasStarted: Bool = false
    var shouldFinish: Bool = false

    @objc func handleScreenEdgeGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            self.hasStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            
            self.shouldFinish = progress > 0.33
            
            self.update(progress)
        case .ended:
            self.hasStarted = false
            self.shouldFinish ? self.finish() : self.cancel()
        case .cancelled:
            self.hasStarted = false
            self.cancel()
        default: return
        }

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



class AnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5.0
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let sourceVC = transitionContext.viewController(forKey: .from),
              let destinationVC = transitionContext.viewController(forKey: .to)
        else {
            return
        }

        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: sourceVC.view.frame.height,
                                           width: sourceVC.view.frame.width,
                                           height: sourceVC.view.frame.height)
        let destinationViewTargetFrame = sourceVC.view.frame


        transitionContext.containerView.addSubview(destinationVC.view)

        destinationVC.view.frame = CGRect(x: 0,
                                          y: -destinationVC.view.frame.height,
                                          width: destinationVC.view.frame.width,
                                          height: destinationVC.view.frame.height)


        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            sourceVC.view.frame = sourceViewTargetFrame
            destinationVC.view.frame = destinationViewTargetFrame
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
    }
}
