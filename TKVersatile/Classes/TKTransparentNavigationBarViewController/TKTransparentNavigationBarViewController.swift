//
//  TKTransparentNavigationBarViewController.swift
//  TKUtilityTools
//
//  Created by zhengxianda on 2018/1/30.
//  Copyright © 2018年 Toki. All rights reserved.
//

import UIKit

open class TKTransparentNavigationBarViewController: UIViewController {

    // MARK: - property
    var navigationControllerCache: UINavigationController?
    var interactiveTransition : UIPercentDrivenInteractiveTransition!
    
    // MARK: - live cycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationControllerCache = navigationController
        navigationControllerCache?.delegate = self
        
        setupGesture()
    }
    
}

extension TKTransparentNavigationBarViewController {
    
    func alphaNavigationBar(progress: CGFloat) {
        guard navigationControllerCache != nil else { return }
        let hide = progress == 0 || navigationControllerCache!.topViewController is TKTransparentNavigationBarViewController
        
        let barBackgroundView = navigationControllerCache!.navigationBar.subviews.first
        barBackgroundView?.alpha = progress
        barBackgroundView?.isHidden = hide
        for view in (barBackgroundView?.subviews)! {
            view.alpha = progress
            view.isHidden = hide
            for subview in view.subviews {
                subview.alpha = progress
                subview.isHidden = hide
            }
        }
        
    }
    
}

extension TKTransparentNavigationBarViewController {
    
    func setupGesture() {
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlerLeftPanGesture(gestureRecognizer:)))
        gesture.edges = .left
        view.addGestureRecognizer(gesture)
    }
    
    @objc func handlerLeftPanGesture(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        var progress = gestureRecognizer.translation(in: view).x / view.bounds.size.width
        progress = min(1.0, max(0.0, progress))
        
        switch gestureRecognizer.state {
        case .began:
            interactiveTransition = UIPercentDrivenInteractiveTransition()
            navigationController?.popViewController(animated: true)
        case .changed:
            interactiveTransition.update(progress)
            alphaNavigationBar(progress: progress)
        case .cancelled, .ended:
            if progress > 0.5 {
                interactiveTransition.finish()
                alphaNavigationBar(progress: 1)
            } else {
                interactiveTransition.cancel()
                alphaNavigationBar(progress: 0)
            }
            interactiveTransition = nil
        case .possible, .failed:
            break
        }
    }
    
}

extension TKTransparentNavigationBarViewController : UINavigationControllerDelegate{
    
    open func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is TKTransparentNavigationBarViewController {
            alphaNavigationBar(progress: 0)
        }
    }
    
    open func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController is TKTransparentNavigationBarViewController {
            alphaNavigationBar(progress: 0)
        }
    }
    
    open func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition
    }
    
    open func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TKTransparentNavigationViewControllerAnimatedTransitioning(method: operation)
    }
    
}
