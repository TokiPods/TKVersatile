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
    public var starStyle: TKStarStyle = .round
    
    /// 星星总数最小值
    public var starCountMinimum: Int = 3
    /// 星星总数最大值
    public var starCountMaximum: Int = 18
    
    /// 区块水平密度
    public var blockHorizontalDensity: Int = 4
    /// 区块垂直密度
    public var blockVerticalDensity: Int = 6
    
    /// 区块中星星密度最小值
    public var starDensityMinimum: Int = 1
    /// 区块中星星密度最大值
    public var starDensityMaximum: Int = 3
    
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
    public var starToAlphaMinimum: CGFloat = 0.4
    /// 星星目标透明度放最大值
    public var starToAlphaMaximum: CGFloat = 0.7
    
    /// 星星闪烁持续时间最小值(单位 s/次)
    public var starFlickerDurationMinimum: CGFloat = 1.5
    /// 星星闪烁持续时间最大值(单位 s/次)
    public var starFlickerDurationMaximum: CGFloat = 3.5
    
    /// 星星颜色
    public var starColor: UIColor = UIColor.white
}
