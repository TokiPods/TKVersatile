//
//  TKCyclicItem.swift
//  TKCyclicView
//
//  Created by zhengxianda on 2018/1/29.
//  Copyright © 2018年 Toki. All rights reserved.
//

import UIKit

public class TKCyclicItem {
    
    // MARK: - property
    var image: UIImage
    var event: () -> Void
    
    // MARK: - live cycle
    public init(image: UIImage, event: @escaping () -> Void) {
        self.image = image
        self.event = event
    }
    
}

extension TKCyclicItem {
    
    @objc public func excute() {
        event()
    }
    
}
