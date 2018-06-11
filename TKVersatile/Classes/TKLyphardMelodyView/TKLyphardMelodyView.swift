//
//  TKLyphardMelodyView.swift
//  Pods-TKVersatile_Example
//
//  Created by zhengxianda on 2018/5/15.
//

import UIKit

/// 星空
public class TKLyphardMelodyView: UIView {
    
    var playing: Bool = false {
        didSet {
            if playing {
                createStarLayers()
            }
        }
    }
    
    public var config: TKLyphardMelodyConfig = TKLyphardMelodyConfig()
    
    var starLayers: [TKStarLayer] = []
    var currentStarCount: Int {
        get {
            return starLayers.count
        }
    }
    
    var blockMap: [[CGRect]] = [[CGRect]]()
    var blockAddressMap: [TKStarLayer: CGRect] = [TKStarLayer: CGRect]()
}

extension TKLyphardMelodyView {
    
    /// 开始动画
    public func play() {
        resetBlockMap()
        playing = true
    }
    
    /// 暂停动画
    public func pause() {
        playing = false
        starLayers.forEach { (starLayer) in
            starLayer.pause()
        }
    }
    
    /// 继续动画
    public func resume() {
        playing = true
        starLayers.forEach { (starLayer) in
            starLayer.resume()
        }
    }
    
}

extension TKLyphardMelodyView {
    
    func resetBlockMap() {
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
        for _ in 1...config.starDensityMaximum {
            blockMap.append([CGRect]())
        }
    }
    
    func createStarLayers() {
        guard playing else { return }
        
        let targetStarCount = currentStarCount == 0 ? (config.starCountMaximum + config.starCountMinimum)/2 : tk_random(with: config.starCountMaximum, and: config.starCountMinimum)
        
        while currentStarCount < targetStarCount {
            //从星星数为0的区块列表中, 获取一个随机的区块, 移动到目标星星数的区块列表
            let blockList = blockMap.first ?? [CGRect]()
            let blockListCount = blockList.count
            let blockNumber = tk_random(with: blockListCount, closed: false)
            let starDensity = tk_random(with: config.starDensityMaximum, and: config.starDensityMinimum)
            move(fromBlockList: 0, index: blockNumber, toBlockList: starDensity)
            
            let block = blockList[blockNumber]
            
            for _ in 0..<starDensity {
                let starFlickerDuration = tk_randomf(with: config.starFlickerDurationMaximum, and: config.starFlickerDurationMinimum)
                let starFromDiameter = tk_randomf(with: config.starFromDiameterMaximum, and: config.starFromDiameterMinimum)
                let starToDiameter = tk_randomf(with: config.starToDiameterMaximum, and: config.starToDiameterMinimum)
                let starFromAlpha = tk_randomf(with: config.starFromAlphaMaximum, and: config.starFromAlphaMinimum)
                let starToAlpha = tk_randomf(with: config.starToAlphaMaximum, and: config.starToAlphaMinimum)
                
                let minDiameter = min(starFromDiameter, starToDiameter)
                let diffDiameter = CGFloat(fabsf(Float(starFromDiameter - starToDiameter)))
                let tempBlockWidth = block.width - minDiameter - 2 * diffDiameter
                let tempBlockHeight = block.height - minDiameter - 2 * diffDiameter
                
                let starX: CGFloat = tk_randomf(with: tempBlockWidth)  + block.minX
                let starY: CGFloat = tk_randomf(with: tempBlockHeight) + block.minY
                
                let starLayer = TKStarLayer(starStyle: config.starStyle,
                                            frame: CGRect(x: starX, y: starY, width: starFromDiameter, height: starFromDiameter),
                                            durationTime: Float(starFlickerDuration),
                                            fromDiameter: Float(starFromDiameter),
                                            toDiameter: Float(starToDiameter),
                                            fromOpacity: Float(starFromAlpha),
                                            toOpacity: Float(starToAlpha),
                                            color: config.starColor.cgColor)
                starLayer.animationDelegate = self
                layer.addSublayer(starLayer)
                starLayers.append(starLayer)
                blockAddressMap[starLayer] = block
            }
        }
    }
    
}

extension TKLyphardMelodyView {
    //从一个区块列表中 移动区块 到另一个区块列表
    func move(fromBlockList currentListIndex: Int, index: Int, toBlockList targetListIndex: Int) {
        //获取起始/目标区块列表
        var currentBlockList = blockMap[currentListIndex]
        var targetBlockList = blockMap[targetListIndex]
        
        //获取区块
        let block = currentBlockList[index]
        
        //移除区块
        currentBlockList.remove(at: index)
        blockMap[currentListIndex] = currentBlockList
        
        //添加区块
        targetBlockList.append(block)
        blockMap[targetListIndex] = targetBlockList
    }
}

extension TKLyphardMelodyView: TKStarLayerAnimationDelegate {    
    public func animationDidStop(_ starLayer: TKStarLayer, anim: CAAnimation, finished flag: Bool) {
        if let index = starLayers.index(of: starLayer) {
            starLayers.remove(at: index)
            if let block = blockAddressMap[starLayer] {
                for i in 1..<blockMap.count {
                    for j in 0..<blockMap[i].count {
                        if block.equalTo(blockMap[i][j]) {
                            move(fromBlockList: i, index: j, toBlockList: i-1)
                            break
                        }
                    }
                }
            }
        }
        createStarLayers()
    }
}
