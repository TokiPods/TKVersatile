//
//  CyclicViewController.swift
//  TKVersatile_Example
//
//  Created by zhengxianda on 2018/2/1.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import TKVersatile

class CyclicViewController: TKTransparentNavigationBarViewController {

    @IBOutlet weak var cyclicView: TKCyclicView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var cyclicItems = [TKCyclicItem]()
        for i in 0..<3 {
            let item = TKCyclicItem(image: UIImage(named: String(format: "image_%d", i))!,
                                    event: { () in
                                        print("=-=", i)
            })
            cyclicItems.append(item)
        }
        
        cyclicView.items = cyclicItems
        cyclicView.autoScroll = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
