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
    
    public func pause() {
        starLayers.forEach { (starLayer) in
            starLayer.pause()
        }
    }
    
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
                    let starDiameter = random * config.starDiameterMaximum - (random - 1) * config.starDiameterMinimum
                    let starFlickerFrequency = random * config.starFlickerFrequencyMaximum - (random - 1) * config.starFlickerFrequencyMinimum
                    let starScale = random * config.starFlickerScaleMaximum - (random - 1) * config.starFlickerScaleMinimum
                    
                    var tempBlockWidth = blockWidth
                    var tempBlockHeight = blockHeight
                    if isRight {
                        tempBlockWidth -= starDiameter
                        tempBlockWidth = min(tempBlockWidth, tempBlockWidth - (starScale - 1) * starDiameter / 2)
                    }
                    if isBottom {
                        tempBlockHeight -= starDiameter
                        tempBlockHeight = min(tempBlockHeight, tempBlockHeight - (starScale - 1) * starDiameter / 2)
                    }
                    
                    let starX: CGFloat = random * tempBlockWidth  + blockX
                    let starY: CGFloat = random * tempBlockHeight + blockY
                    
                    let starLayer = TKStarLayer(starStyle: .round,
                                                frame: CGRect(x: starX, y: starY, width: starDiameter, height: starDiameter),
                                                frequency: Float(starFlickerFrequency),
                                                scale: Float(starScale),
                                                color: config.starColor.cgColor)
                    
                    starLayers.append(starLayer)
                }
                
            }
        }
        
        return starLayers
    }
    
}
