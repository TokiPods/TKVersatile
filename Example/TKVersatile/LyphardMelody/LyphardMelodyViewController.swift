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

    override func viewDidAppear(_ animated: Bool) {
        lyphardMelodyView.play()
    }
 
    override func viewDidDisappear(_ animated: Bool) {
        lyphardMelodyView.pause()
    }
}

extension LyphardMelodyViewController {
    func setupUI() {
        view.backgroundColor = UIColor.black
        
        lyphardMelodyView.backgroundColor = UIColor.gray
        view.addSubview(lyphardMelodyView)
        lyphardMelodyView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
    }
}
