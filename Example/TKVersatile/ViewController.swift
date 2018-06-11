//
//  ViewController.swift
//  TKVersatile
//
//  Created by ZhengXianda0512 on 02/01/2018.
//  Copyright (c) 2018 ZhengXianda0512. All rights reserved.
//

import UIKit
import TKDisplayCabinet

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let list: [(title: String, type: UIViewController.Type)] =
            [(title: "Cyclic", type: CyclicViewController.self),
             (title: "TransparentNavigationBar", type: TransparentNavigationBarViewController.self),
             (title: "LyphardMelody", type: LyphardMelodyViewController.self),
             (title: "Repple", type: ReppleViewController.self)]
        let displayCabinet = TKDisplayCabinetViewController.init(list: list)
        present(UINavigationController(rootViewController: displayCabinet), animated: true, completion: nil)
    }
    
}
