//
//  TKCyclicView.swift
//  TKCyclicView
//
//  Created by zhengxianda on 2018/1/28.
//  Copyright © 2018年 Toki. All rights reserved.
//

import UIKit

public class TKCyclicView: UIView, UIScrollViewDelegate{
    
    // MARK: - property
    public var currentPage: Int = 0
    
    public var items = [TKCyclicItem]() {
        didSet {
            //remove all
            for subview in scrollView.subviews {
                subview.removeFromSuperview()
            }
            //add images
            for i in 0..<items.count {
                let item = items[i]
                let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: CGFloat(i) * frame.size.width, y: 0), size: frame.size))
                imageView.addGestureRecognizer(UITapGestureRecognizer(target: item, action: #selector(item.excute)))
                imageView.isUserInteractionEnabled = true
                imageView.image = item.image
                scrollView.addSubview(imageView)
            }
            
            scrollView.contentSize = CGSize(width: CGFloat(items.count) * frame.size.width, height: 0)
            scrollView.numberOfPages = items.count
            pageControl.numberOfPages = items.count
            
            if currentPage > items.count { currentPage = 0 }
        }
    }
    
    public var autoScrollInterval: TimeInterval = 3
    
    public var autoScroll = false {
        willSet {
            if newValue {
                autoScrollTimer.fireDate = Date()
            }else{
                autoScrollTimer.fireDate = Date.distantFuture
            }
        }
    }
    
    lazy var autoScrollTimer : Timer = {
        let temp = Timer.scheduledTimer(timeInterval: self.autoScrollInterval,
                                        target:self.scrollView,
                                        selector: #selector(self.scrollView.autoChange),
                                        userInfo: nil,
                                        repeats: true)
        return temp
    }()
    
    // MARK: - UI property
    
    lazy var scrollView : TKCyclicScrollView = {
        let temp = TKCyclicScrollView()
        temp.delegate = self
        return temp
    }()
    
    lazy var pageControl : TKCyclicPageControl = {
        let temp = TKCyclicPageControl()
        return temp
    }()
    
    // MARK: - live cycle
    
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    deinit {
        autoScrollTimer.invalidate()
    }
}

extension TKCyclicView {
    
    func change(pageNumber: Int) {
        scrollView.change(pageNumber: currentPage)
    }
    
}

extension TKCyclicView {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        pageControl.frame = CGRect(origin: CGPoint(x: frame.size.width/2, y: frame.size.height - 10),
                                   size: CGSize.zero)
    }
    
}

extension TKCyclicView {
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bannerScrollView = scrollView as! TKCyclicScrollView
        
        currentPage = Int(scrollView.contentOffset.x / frame.size.width)
        pageControl.currentPage = currentPage
        bannerScrollView.currentPage = currentPage
    }
    
}

extension TKCyclicView {
    
    func setupUI() {
        addSubview(scrollView)
        addSubview(pageControl)
    }
    
}
