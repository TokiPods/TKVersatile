//
//  TransparentNavigationViewControllerAnimatedTransitioning.swift
//  Pods-TKVersatile_Example
//
//  Created by zhengxianda on 2018/2/1.
//

import UIKit


class TransparentNavigationViewControllerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    var method: UINavigationControllerOperation = .none
    
    init(method: UINavigationControllerOperation) {
        self.method = method
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromVc = transitionContext.viewController(forKey: .from)
        let toVc = transitionContext.viewController(forKey: .to)
        
        containerView.addSubview(toVc!.view)
        containerView.sendSubview(toBack: toVc!.view)
        
        let width = fromVc?.view.bounds.width
        let height = fromVc?.view.bounds.height
        
        let blackView = UIView(frame: CGRect(x: 0, y: 0, width: width!, height: height!))
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0.7
        containerView.insertSubview(blackView, belowSubview: fromVc!.view)
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: { () -> Void in
            var offset: CGFloat = 0
            switch self.method {
            case .pop :
                offset = 1
            case .push :
                offset = -1
            case .none:
                break
            }
            
            fromVc?.view.frame = CGRect(x: offset * width!, y: 0, width: width!, height: height!)
            toVc?.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            blackView.alpha = 0
        }) { (_) -> Void in
            blackView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
