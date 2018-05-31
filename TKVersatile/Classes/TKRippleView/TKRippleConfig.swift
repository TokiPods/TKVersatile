//
//  TKRippleConfig.swift
//  TKVersatile
//
//  Created by zhengxianda on 2018/5/28.
//

import Foundation

/// 波纹参数配置
public class TKRippleConfig {
    
    /// 水波风格
    var style: TKWaveStyle = .round
    
    /// 水波目标直径
    public var rippleToDiameter: CGFloat = 325
    
    /// 水波初始透明度
    public var rippleFromAlpha: CGFloat = 0.6
    
    /// 水波目标透明度
    public var rippleToAlpha: CGFloat = 0
    
    /// 水波扩散时间(单位 s/次)
    public var rippleDiffusionDuration: CGFloat = 4
    
    /// 水波生成间隔(单位 s)
    public var rippleCreateInterval: CGFloat = 1.2

    /// 水波颜色
    public var waveColor: UIColor = UIColor.white
}
