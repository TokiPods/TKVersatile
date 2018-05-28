//
//  TKFlickerAnimation.swift
//  TKVersatile
//
//  Created by zhengxianda on 2018/5/16.
//

import UIKit

public class TKFlickerAnimationGroup: CAAnimationGroup {
    
    /// 初始化闪烁动画
    ///
    /// - Parameters:
    ///   - frequency: 闪烁频率(次/s)
    ///   - timingFunction: 动画时间
    ///   - fromScale: 初始直径
    ///   - toScale: 目标直径
    ///   - fromOpacity: 初始透明度
    ///   - toOpacity: 目标透明度
    public convenience init(frequency: Float, timingFunction: CAMediaTimingFunction,
                            fromScale: Float, toScale: Float,
                            fromOpacity: Float, toOpacity: Float) {
        self.init()
        
        let diameterAnimation = TKFlickerScaleAnimation(frequency: frequency, timingFunction: timingFunction, fromScale: fromScale, toScale: toScale)
        let opacityAnimation = TKFlickerOpacityAnimation(frequency: frequency, timingFunction: timingFunction, fromOpacity: fromOpacity, toOpacity: toOpacity)
        self.animations = [diameterAnimation, opacityAnimation]
        
        self.duration = CFTimeInterval(1/frequency) // 动画持续时间
        self.repeatCount = Float(Int.max) // 重复次数为无限
        self.autoreverses = true // 动画结束时执行逆动画
    }
    
}

public class TKFlickerScaleAnimation: CABasicAnimation {
    
    /// 初始化闪烁动画
    ///
    /// - Parameters:
    ///   - frequency: 闪烁频率(次/s)
    ///   - timingFunction: 动画时间
    ///   - fromScale: 初始直径
    ///   - toScale: 目标直径
    public convenience init(frequency: Float, timingFunction: CAMediaTimingFunction,
                            fromScale: Float, toScale: Float) {
        // 设定为缩放
        self.init(keyPath: "transform.scale")
        
        // 动画选项设定
        self.timingFunction = timingFunction
        self.duration = CFTimeInterval(1/frequency) // 动画持续时间
        self.repeatCount = Float(Int.max) // 重复次数为无限
        self.autoreverses = true // 动画结束时执行逆动画
        
        // 缩放倍数
        self.fromValue = fromScale // 开始时的倍率
        self.toValue = toScale // 结束时的倍率
    }
    
}

public class TKFlickerOpacityAnimation: CABasicAnimation {
    
    /// 初始化闪烁动画
    ///
    /// - Parameters:
    ///   - frequency: 闪烁频率(次/s)
    ///   - timingFunction: 动画时间
    ///   - fromOpacity: 初始透明度
    ///   - toOpacity: 目标透明度
    public convenience init(frequency: Float, timingFunction: CAMediaTimingFunction,
                            fromOpacity: Float, toOpacity: Float) {
        // 设定为缩放
        self.init(keyPath: "opacity")
        
        // 动画选项设定
        self.timingFunction = timingFunction
        self.duration = CFTimeInterval(1/frequency) // 动画持续时间
        self.repeatCount = Float(Int.max) // 重复次数为无限
        self.autoreverses = true // 动画结束时执行逆动画
        
        // 缩放倍数
        self.fromValue = fromOpacity // 开始时的倍率
        self.toValue = toOpacity // 结束时的倍率
    }
    
}
