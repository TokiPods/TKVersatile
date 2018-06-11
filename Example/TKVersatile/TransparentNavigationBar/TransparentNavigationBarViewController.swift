//
//  TransparentNavigationBarViewController.swift
//  TKVersatile_Example
//
//  Created by zhengxianda on 2018/6/11.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import TKVersatile

class TransparentNavigationBarViewController: TKTransparentNavigationBarViewController {

    lazy var button : UIButton = {
        let temp = UIButton()
        return temp
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupUIResponse()
    }

}

extension TransparentNavigationBarViewController {
    
    @objc func buttonTapped() {
        navigationController?.pushViewController(TransparentNavigationBarViewController(), animated: true)
    }
    
}

extension TransparentNavigationBarViewController {
    
    func setupUI() {
        button.setTitle("Present", for: UIControlState.normal)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    func setupUIResponse() {
        button.addTarget(self, action: #selector(buttonTapped), for: UIControlEvents.touchUpInside)
    }
    
}
