//
//  TKRippleView.swift
//  Pods-TKVersatile_Example
//
//  Created by zhengxianda on 2018/5/28.
//

import Foundation

/// 波纹
public class TKRippleView: UIView {
    
    var playing: Bool = false {
        didSet {
            if playing {
                createWaveLayer()
            }
        }
    }
    
    public var config: TKRippleConfig = TKRippleConfig()
    
}

extension TKRippleView {
    
    /// 开始动画
    public func play() {
        playing = true
    }
    
    /// 暂停动画
    public func pause() {
        playing = false
    }
    
    /// 继续动画
    public func resume() {
        playing = true
    }
    
}

extension TKRippleView {
    
    func createWaveLayer() {
        guard playing else { return }
        
        let waveLayer = TKWaveLayer(waveStyle: config.style,
                                    frame: CGRect(origin: CGPoint.zero, size: frame.size),
                                    durationTime: Float(config.rippleDiffusionDuration),
                                    fromDiameter: Float(min(frame.width, frame.height)),
                                    toDiameter: Float(config.rippleToDiameter),
                                    fromOpacity: Float(config.rippleFromAlpha),
                                    toOpacity: Float(config.rippleToAlpha),
                                    color: config.waveColor.cgColor)
        layer.addSublayer(waveLayer)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(integerLiteral: Int(config.rippleCreateInterval))) { [weak self] in
            self?.createWaveLayer()
        }
        
    }
    
}
