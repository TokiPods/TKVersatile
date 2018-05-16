//
//  TKStarLayer.swift
//  Pods-TKVersatile_Example
//
//  Created by zhengxianda on 2018/5/16.
//

import UIKit

public class TKStarLayer: CAShapeLayer {
    
    let kStarAnimationKey: String = "TKStarAnimationKey"
    
    /// 星星风格
    public var starStyle: TKStarPath.Style = .round {
        didSet {
            path = TKStarPath(style: starStyle, size: frame.size).cgPath
        }
    }
    
    /// 星星位置、尺寸
    public override var frame: CGRect {
        didSet {
            lineWidth = frame.size.width / 5
            path = TKStarPath(style: starStyle, size: frame.size).cgPath
        }
    }
    
    /// 星星闪烁频率
    public var frequency: Float = 5 {
        didSet {
            restart()
        }
    }
    
    /// 星星缩放比例
    public var scale: Float = 0 {
        didSet {
            restart()
        }
    }
    
    /// 星星颜色
    public var color: CGColor = UIColor.white.cgColor {
        didSet {
            fillColor = color
            strokeColor = color.copy(alpha: 0.5)
        }
    }
    
    
    /// 初始化星星图层
    ///
    /// - Parameters:
    ///   - starStyle: 星星风格
    ///   - frame: 星星位置、尺寸
    ///   - frequency: 星星闪烁频率
    ///   - scale: 星星缩放比例
    ///   - color: 星星颜色
    public convenience init(starStyle: TKStarPath.Style,
                     frame: CGRect,
                     frequency: Float = 5,
                     scale: Float = 0,
                     color: CGColor = UIColor.white.cgColor) {
        self.init()
        
        self.frame = frame
        self.starStyle = starStyle
        self.frequency = frequency
        self.scale = scale
        self.color = color
        
        lineWidth = frame.size.width / 5
     
        path = TKStarPath(style: starStyle, size: frame.size).cgPath
        start()
        
        fillColor = color
        strokeColor = color.copy(alpha: 0.5)
    }
    
}

extension TKStarLayer {
    
    public func start() {
        guard animation(forKey: kStarAnimationKey) == nil else { return }
        add(TKFlickerAnimation(frequency: frequency, scale: scale), forKey: kStarAnimationKey)
    }
    
    public func pause() {
        guard speed > 0.0 else { return }
        let pausedTime = convertTime(CACurrentMediaTime(), from: nil)
        speed = 0.0
        timeOffset = pausedTime
    }
    
    public func resume() {
        guard timeOffset > 0.0 else { return }
        let pausedTime = timeOffset
        speed = 1.0
        timeOffset = 0.0
        beginTime = 0.0
        let timeSincePause = convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        beginTime = timeSincePause
    }
    
    public func stop() {
        removeAnimation(forKey: kStarAnimationKey)
    }
    
    public func restart() {
        stop()
        start()
    }
}
