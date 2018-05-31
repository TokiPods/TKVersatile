//
//  DispatchTime+Extension.swift
//  Pods-TKVersatile_Example
//
//  Created by zhengxianda on 2018/5/28.
//

import Foundation

extension DispatchTime: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = DispatchTime.now() + .seconds(value)
    }
}
