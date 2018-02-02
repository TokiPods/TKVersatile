//
//  TKCyclicPageControl.swift
//  TKCyclicView
//
//  Created by zhengxianda on 2018/1/28.
//  Copyright © 2018年 Toki. All rights reserved.
//

import UIKit

class TKCyclicPageControl: UIPageControl {

    // MARK: - property
    lazy var customPageDot : UIView = {
        let dotView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 10, height: 7)))
        dotView.backgroundColor = UIColor(white: 0, alpha: 0.6)
        let containerView =  UIView(frame: CGRect(x: -1.5, y: 0, width: 10, height: 7))
        containerView.backgroundColor = UIColor.white
        containerView.addSubview(dotView)
        containerView.layer.cornerRadius = 3.5
        containerView.layer.masksToBounds = true
        return containerView
    }()
    
    override var currentPage: Int {
        willSet {
            guard newValue >= 0 else { return }
            subviews[newValue].addSubview(customPageDot)
        }
    }

}
