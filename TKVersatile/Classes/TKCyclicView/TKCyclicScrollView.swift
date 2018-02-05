//
//  TKCyclicScrollView.swift
//  TKCyclicView
//
//  Created by zhengxianda on 2018/1/28.
//  Copyright © 2018年 Toki. All rights reserved.
//

import UIKit

class TKCyclicScrollView: UIScrollView {
    
    // MARK: - property
    var currentPage: Int = 0
    var numberOfPages: Int = 0
    
    // MARK: - live cycle
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
}

extension TKCyclicScrollView {
    
    @objc func autoChange() {
        change(pageNumber: currentPage + 1)
    }
    
    func change(pageNumber: Int) {
        let x = bounds.size.width * CGFloat(pageNumber % numberOfPages)
        setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
}

extension TKCyclicScrollView {
    
    func setupUI() -> Void {
        isPagingEnabled = true
        bounces = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
}
