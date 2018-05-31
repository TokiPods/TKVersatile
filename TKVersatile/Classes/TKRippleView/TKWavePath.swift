//
//  TKWavePath.swift
//  TKVersatile
//
//  Created by zhengxianda on 2018/5/28.
//

import Foundation

public class TKWavePath: UIBezierPath {
    
    /// 初始化水波图案
    ///
    /// - Parameters:
    ///   - style: 水波风格
    ///   - frame: 水波尺寸
    public convenience init(style: TKWaveStyle, size: CGSize){
        switch style {
        case .round:
            self.init(ovalIn: CGRect(origin: CGPoint.zero, size: size))
        }
    }
}
