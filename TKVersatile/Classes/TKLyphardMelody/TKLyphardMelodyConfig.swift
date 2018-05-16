//
//  TKLyphardMelodyConfig.swift
//  Pods-TKVersatile_Example
//
//  Created by zhengxianda on 2018/5/15.
//

import UIKit

/// 星空参数配置
public class TKLyphardMelodyConfig {
    /// 区块水平密度
    public var blockHorizontalDensity: Int = 3
    /// 区块垂直密度
    public var blockVerticalDensity: Int = 3
    /// 区块中星星密度
    public var starDensity: Int = 2
    
    /// 星星直径最小值
    public var starDiameterMinimum: CGFloat = 1
    /// 星星直径最大值
    public var starDiameterMaximum: CGFloat = 10
    
    /// 星星闪烁频率最小值(单位 次/s)
    public var starFlickerFrequencyMinimum: CGFloat = 0.3
    /// 星星闪烁频率最大值(单位 次/s)
    public var starFlickerFrequencyMaximum: CGFloat = 1
    
    /// 星星闪烁缩放最小值
    public var starFlickerScaleMinimum: CGFloat = 0
    /// 星星闪烁缩放最大值
    public var starFlickerScaleMaximum: CGFloat = 2
    
    /// 星星颜色
    public var starColor: UIColor = UIColor.white
}
