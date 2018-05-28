//
//  TKLyphardMelodyView.swift
//  Pods-TKVersatile_Example
//
//  Created by zhengxianda on 2018/5/15.
//

import UIKit

/// 星空
public class TKLyphardMelodyView: UIView {
    
    public var config: TKLyphardMelodyConfig = TKLyphardMelodyConfig() {
        didSet {
            refreshStarLayers()
        }
    }
    
    var starLayers: [TKStarLayer] = []
    
    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        refreshStarLayers()
    }
    
}

extension TKLyphardMelodyView {
    
    /// 暂停动画
    public func pause() {
        starLayers.forEach { (starLayer) in
            starLayer.pause()
        }
    }
    
    /// 继续动画
    public func resume() {
        starLayers.forEach { (starLayer) in
            starLayer.resume()
        }
    }
    
}

extension TKLyphardMelodyView {
    
    func refreshStarLayers() {
        removeStarLayers()
        starLayers = createStarLayers(frame: frame, config: config)
        addStarLayers()
    }
    
    func removeStarLayers() {
        starLayers.forEach { (starLayer) in
            starLayer.removeFromSuperlayer()
        }
    }
    
    func addStarLayers() {
        starLayers.forEach { (starLayer) in
            layer.addSublayer(starLayer)
        }
    }
    
}

extension TKLyphardMelodyView {
    
    var random: CGFloat {
        get {
            return CGFloat(arc4random() % 100) / 100
        }
    }
    
    func createStarLayers(frame: CGRect, config: TKLyphardMelodyConfig) -> [TKStarLayer] {
        var starLayers: [TKStarLayer] = []
        
        let blockWidth: CGFloat = frame.width / CGFloat(config.blockHorizontalDensity)
        let blockHeight: CGFloat = frame.height / CGFloat(config.blockVerticalDensity)
        
        for blockHorizontalNumber in 0..<config.blockHorizontalDensity {
            for blockVerticalNumber in 0..<config.blockVerticalDensity {
                
                let blockX: CGFloat = blockWidth * CGFloat(blockHorizontalNumber)
                let blockY: CGFloat = blockHeight * CGFloat(blockVerticalNumber)
                
                let isBottom = blockHorizontalNumber+1 == config.blockHorizontalDensity //下方边缘
                let isRight = blockVerticalNumber+1 == config.blockVerticalDensity //右侧边缘
                
                for _ in 0..<config.starDensity {
                    let starFlickerDuration = random * config.starFlickerDurationMaximum - (random - 1) * config.starFlickerDurationMinimum
                    let starFromDiameter = random * config.starFromDiameterMaximum - (random - 1) * config.starFromDiameterMinimum
                    let starToDiameter = random * config.starToDiameterMaximum - (random - 1) * config.starToDiameterMinimum
                    let starFromAlpha = random * config.starFromAlphaMaximum - (random - 1) * config.starFromAlphaMinimum
                    let starToAlpha = random * config.starToAlphaMaximum - (random - 1) * config.starToAlphaMinimum
                    
                    var tempBlockWidth = blockWidth
                    var tempBlockHeight = blockHeight
                    if isRight {
                        tempBlockWidth -= max(starToDiameter, starToDiameter)
                    }
                    if isBottom {
                        tempBlockHeight -= max(starToDiameter, starToDiameter)
                    }
                    
                    let starX: CGFloat = random * tempBlockWidth  + blockX
                    let starY: CGFloat = random * tempBlockHeight + blockY
                    
                    let starLayer = TKStarLayer(starStyle: config.starStyle,
                                                frame: CGRect(x: starX, y: starY, width: starFromDiameter, height: starFromDiameter),
                                                durationTime: Float(starFlickerDuration),
                                                fromDiameter: Float(starFromDiameter),
                                                toDiameter: Float(starToDiameter),
                                                fromOpacity: Float(starFromAlpha),
                                                toOpacity: Float(starToAlpha),
                                                color: config.starColor.cgColor)
                    
                    starLayers.append(starLayer)
                }
                
            }
        }
        
        return starLayers
    }
    
}
