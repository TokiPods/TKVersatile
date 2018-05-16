//
//  CyclicViewController.swift
//  TKVersatile_Example
//
//  Created by zhengxianda on 2018/2/1.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import TKVersatile

class CyclicViewController: UIViewController {

    lazy var cyclicView: TKCyclicView = {
        let temp = TKCyclicView()
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var cyclicItems = [TKCyclicItem]()
        for i in 0..<3 {
            let item = TKCyclicItem(image: UIImage(named: String(format: "image_%d", i))!,
                                    event: { () in
                                        print("touch image : ", i)
            })
            cyclicItems.append(item)
        }
        
        cyclicView.items = cyclicItems
        cyclicView.autoScroll = true
    }

}

extension CyclicViewController {
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(cyclicView)
        cyclicView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(50, 50, 50, 50))
        }
    }
    
}
