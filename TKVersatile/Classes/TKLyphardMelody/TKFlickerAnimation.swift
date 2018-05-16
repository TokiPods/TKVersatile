//
//  TKFlickerAnimation.swift
//  TKVersatile
//
//  Created by zhengxianda on 2018/5/16.
//

import UIKit

public class TKFlickerAnimation: CABasicAnimation {
    
    /// 初始化闪烁动画
    ///
    /// - Parameters:
    ///   - frequency: 闪烁频率(次/s)
    ///   - scale: 缩放比例
    public convenience init(frequency: Float, scale: Float) {
        // 设定为缩放
        self.init(keyPath: "transform.scale")
        
        // 动画选项设定
        self.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        self.duration = CFTimeInterval(1/frequency) // 动画持续时间
        self.repeatCount = Float(Int.max) // 重复次数为无限
        self.autoreverses = true // 动画结束时执行逆动画
        
        // 缩放倍数
        self.fromValue = 1.0 // 开始时的倍率
        self.toValue = scale // 结束时的倍率
    }

}
