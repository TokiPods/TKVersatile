//
//  TKLyphardMelodyConfig.swift
//  Pods-TKVersatile_Example
//
//  Created by zhengxianda on 2018/5/15.
//

import UIKit

/// 星空参数配置
public class TKLyphardMelodyConfig {
    
    /// 星星风格
    public var starStyle: TKStarPath.Style = .round
    
    /// 区块水平密度
    public var blockHorizontalDensity: Int = 3
    /// 区块垂直密度
    public var blockVerticalDensity: Int = 3
    /// 区块中星星密度
    public var starDensity: Int = 2
    
    /// 星星初始直径最小值
    public var starFromDiameterMinimum: CGFloat = 0
    /// 星星初始直径最大值
    public var starFromDiameterMaximum: CGFloat = 0
    
    /// 星星目标直径最小值
    public var starToDiameterMinimum: CGFloat = 4
    /// 星星目标直径最大值
    public var starToDiameterMaximum: CGFloat = 5
    
    /// 星星初始透明度最小值
    public var starFromAlphaMinimum: CGFloat = 0
    /// 星星初始透明度放最大值
    public var starFromAlphaMaximum: CGFloat = 0
    
    /// 星星目标透明度最小值
    public var starToAlphaMinimum: CGFloat = 0.6
    /// 星星目标透明度放最大值
    public var starToAlphaMaximum: CGFloat = 0.6
    
    /// 星星闪烁频率最小值(单位 次/s)
    public var starFlickerFrequencyMinimum: CGFloat = 0.4
    /// 星星闪烁频率最大值(单位 次/s)
    public var starFlickerFrequencyMaximum: CGFloat = 0.5
    
    /// 星星颜色
    public var starColor: UIColor = UIColor.white
}
