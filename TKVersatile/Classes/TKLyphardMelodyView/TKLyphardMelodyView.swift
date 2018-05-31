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
    
    var blockMap: [[CGRect]] = [[CGRect]]()
    
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
        resetBlockMap(frame: frame, config: config)
        starLayers = createStarLayers(blockList: blockMap.first!, config: config)
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
    
    func resetBlockMap(frame: CGRect, config: TKLyphardMelodyConfig) {
        var blockList_Zero = [CGRect]()
        
        let blockWidth: CGFloat = frame.width / CGFloat(config.blockHorizontalDensity)
        let blockHeight: CGFloat = frame.height / CGFloat(config.blockVerticalDensity)
        
        for blockHorizontalNumber in 0..<config.blockHorizontalDensity {
            for blockVerticalNumber in 0..<config.blockVerticalDensity {
                
                let blockX: CGFloat = blockWidth * CGFloat(blockHorizontalNumber)
                let blockY: CGFloat = blockHeight * CGFloat(blockVerticalNumber)
                
                blockList_Zero.append(CGRect(x: blockX, y: blockY, width: blockWidth, height: blockHeight))
            }
        }
        
        blockMap.append(blockList_Zero)
    }
    
    func createStarLayers(blockList: [CGRect], config: TKLyphardMelodyConfig) -> [TKStarLayer] {
        var starLayers: [TKStarLayer] = []
        
        blockList.forEach { (block) in
            for _ in 0..<config.starDensity {
                let starFlickerDuration = random * (config.starFlickerDurationMaximum - config.starFlickerDurationMinimum) + config.starFlickerDurationMinimum
                let starFromDiameter = random * (config.starFromDiameterMaximum - config.starFromDiameterMinimum) + config.starFromDiameterMinimum
                let starToDiameter = random * (config.starToDiameterMaximum - config.starToDiameterMinimum) + config.starToDiameterMinimum
                let starFromAlpha = random * (config.starFromAlphaMaximum - config.starFromAlphaMinimum) + config.starFromAlphaMinimum
                let starToAlpha = random * (config.starToAlphaMaximum - config.starToAlphaMinimum) + config.starToAlphaMinimum
                
                let minDiameter = CGFloat(min(starFromDiameter, starToDiameter))
                let diffDiameter = CGFloat(fabsf(Float(starFromDiameter - starToDiameter)))
                let tempBlockWidth = block.width - minDiameter - 2 * diffDiameter
                let tempBlockHeight = block.height - minDiameter - 2 * diffDiameter
                
                let starX: CGFloat = random * tempBlockWidth  + block.minX
                let starY: CGFloat = random * tempBlockHeight + block.minY
                
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
        
        return starLayers
    }
    
}
