//
//  TKDisplayCabinetViewController.swift
//  TKVersatile
//
//  Created by ZhengXianda0512 on 02/01/2018.
//  Copyright (c) 2018 ZhengXianda0512. All rights reserved.
//

import UIKit

open class TKDisplayCabinetViewController: UITableViewController {
    
    var list: [(title: String, type: UIViewController.Type)] = [(title: String, type: UIViewController.Type)]()
    let cellType = UITableViewCell.self
    
    public init(list: [(title: String, type: UIViewController.Type)]) {
        super.init(style: UITableViewStyle.plain)
        
        self.list = list
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

extension TKDisplayCabinetViewController {
    
    func setupUI() {
        self.tableView.register(cellType, forCellReuseIdentifier: NSStringFromClass(cellType))
    }
    
}

extension TKDisplayCabinetViewController {
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(cellType), for: indexPath)
        cell.textLabel?.text = list[indexPath.row].title
        return cell
    }
    
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(list[indexPath.row].type.init(), animated: true)
    }
    
}
