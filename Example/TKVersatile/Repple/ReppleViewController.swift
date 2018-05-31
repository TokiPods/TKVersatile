//
//  ReppleViewController.swift
//  TKVersatile_Example
//
//  Created by zhengxianda on 2018/5/28.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import TKVersatile

class ReppleViewController: UIViewController {

    lazy var reppleView : TKRippleView = {
        let temp = TKRippleView()
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        reppleView.play()
    }
}

extension ReppleViewController {
    func setupUI() {
        view.backgroundColor = UIColor.black
        
        view.addSubview(reppleView)
        reppleView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(100, 100, 100, 100))
        }
    }
}

