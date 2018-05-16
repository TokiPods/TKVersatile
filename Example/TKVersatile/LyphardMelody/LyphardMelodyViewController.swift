//
//  LyphardMelodyViewController.swift
//  TKVersatile_Example
//
//  Created by zhengxianda on 2018/5/16.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import TKVersatile

class LyphardMelodyViewController: UIViewController {

    lazy var lyphardMelodyView : TKLyphardMelodyView = {
        let temp = TKLyphardMelodyView()
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

extension LyphardMelodyViewController {
    func setupUI() {
        view.backgroundColor = UIColor.black
        
        view.addSubview(lyphardMelodyView)
        lyphardMelodyView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(50, 50, 50, 50))
        }
    }
}
