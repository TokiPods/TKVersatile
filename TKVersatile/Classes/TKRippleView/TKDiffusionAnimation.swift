//
//  TKDiffusionAnimation.swift
//  TKVersatile
//
//  Created by zhengxianda on 2018/5/28.
//

import Foundation

public class TKDiffusionAnimationGroup: CAAnimationGroup {
    
    /// 初始化扩散动画
    ///
    /// - Parameters:
    ///   - durationTime: 扩散持续时间(s/次)
    ///   - timingFunction: 动画时间
    ///   - fromScale: 初始直径
    ///   - toScale: 目标直径
    ///   - fromOpacity: 初始透明度
    ///   - toOpacity: 目标透明度
    public convenience init(durationTime: Float, timingFunction: CAMediaTimingFunction,
                            fromScale: Float, toScale: Float,
                            fromOpacity: Float, toOpacity: Float) {
        self.init()
        
        let diameterAnimation = TKFlickerScaleAnimation(durationTime: durationTime, timingFunction: timingFunction, fromScale: fromScale, toScale: toScale)
        let opacityAnimation = TKFlickerOpacityAnimation(durationTime: durationTime, timingFunction: timingFunction, fromOpacity: fromOpacity, toOpacity: toOpacity)
        self.animations = [diameterAnimation, opacityAnimation]
        
        self.duration = CFTimeInterval(durationTime) // 动画持续时间
    }
    
}

public class TKDiffusionScaleAnimation: CABasicAnimation {
    
    /// 初始化扩散动画
    ///
    /// - Parameters:
    ///   - durationTime: 扩散持续时间(s/次)
    ///   - timingFunction: 动画时间
    ///   - fromScale: 初始直径
    ///   - toScale: 目标直径
    public convenience init(durationTime: Float, timingFunction: CAMediaTimingFunction,
                            fromScale: Float, toScale: Float) {
        // 设定为缩放
        self.init(keyPath: "transform.scale")
        
        // 动画选项设定
        self.timingFunction = timingFunction
        self.duration = CFTimeInterval(durationTime) // 动画持续时间
        
        // 缩放倍数
        self.fromValue = fromScale // 开始时的倍率
        self.toValue = toScale // 结束时的倍率
    }
    
}

public class TKDiffusionOpacityAnimation: CABasicAnimation {
    
    /// 初始化扩散动画
    ///
    /// - Parameters:
    ///   - durationTime: 扩散持续时间(s/次)
    ///   - timingFunction: 动画时间
    ///   - fromOpacity: 初始透明度
    ///   - toOpacity: 目标透明度
    public convenience init(durationTime: Float, timingFunction: CAMediaTimingFunction,
                            fromOpacity: Float, toOpacity: Float) {
        // 设定为缩放
        self.init(keyPath: "opacity")
        
        // 动画选项设定
        self.timingFunction = timingFunction
        self.duration = CFTimeInterval(durationTime) // 动画持续时间
        
        // 缩放倍数
        self.fromValue = fromOpacity // 开始时的倍率
        self.toValue = toOpacity // 结束时的倍率
    }
    
}

