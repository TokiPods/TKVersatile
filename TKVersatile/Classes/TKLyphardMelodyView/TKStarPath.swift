//
//  TKStarPath.swift
//  TKVersatile
//
//  Created by zhengxianda on 2018/5/16.
//

import UIKit

public class TKStarPath: UIBezierPath {
    
    /// 初始化星星图案
    ///
    /// - Parameters:
    ///   - style: 星星风格
    ///   - frame: 星星尺寸
    public convenience init(style: TKStarStyle, size: CGSize){
        switch style {
        case .round:
            self.init(ovalIn: CGRect(origin: CGPoint.zero, size: size))
        }
    }
}
