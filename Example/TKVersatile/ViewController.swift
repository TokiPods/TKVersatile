//
//  ViewController.swift
//  TKVersatile
//
//  Created by ZhengXianda0512 on 02/01/2018.
//  Copyright (c) 2018 ZhengXianda0512. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let list: [(title: String, type: UIViewController.Type)] =
        [(title: "Cyclic", type: CyclicViewController.self),
         (title: "LyphardMelody", type: LyphardMelodyViewController.self)]
    let cellType = UITableViewCell.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

extension ViewController {
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        title = NSStringFromClass(self.classForCoder)
        
        self.tableView.register(cellType, forCellReuseIdentifier: NSStringFromClass(cellType))
    }
    
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(cellType), for: indexPath)
        cell.textLabel?.text = list[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(list[indexPath.row].type.init(), animated: true)
    }
    
}
