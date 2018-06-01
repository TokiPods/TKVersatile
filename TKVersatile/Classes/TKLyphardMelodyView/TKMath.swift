//
//  TKMath.swift
//  Pods-TKVersatile_Example
//
//  Created by zhengxianda on 2018/6/1.
//

import Foundation

func tk_random(with value1: Int, and value2: Int = 0, closed: Bool = true) -> Int {
    return Int(tk_randomf(with: Float(value1), and: Float(value2), closed: closed, precision: 0))
}

func tk_randomf(with value1: Float, and value2: Float = 0, closed: Bool = true, precision: Int = 2) -> Float {
    guard value1 != value2 else { return value1 }
    let minValue = min(value1, value2)
    let diffValue = fabsf(value1 - value2)
    let precisionValue = powf(10, Float(precision))
    return Float(arc4random() % UInt32(diffValue * precisionValue + (closed ? 1 : 0))) / precisionValue + minValue
}

func tk_randomf(with value1: CGFloat, and value2: CGFloat = 0, closed: Bool = true, precision: Int = 2) -> CGFloat {
    return CGFloat(tk_randomf(with: Float(value1), and: Float(value2), closed: closed, precision: precision))
}
