//
//  SettingViewController.swift
//  uso
//
//  Created by 서재훈 on 2020/06/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift

class SettingViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: MainCoordinator?
    var viewModel: SettingViewModel!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        bindRX()
    }
    
    private func bindRX() {
        viewModel.allSettings
            .bind(to: tableView.rx.items) { (tableView, row, item) -> UITableViewCell in
                if row == 0 {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: MySettingTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? MySettingTableViewCell else { fatalError() }
                    cell.onData.onNext(item)
                    return cell
                } else {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingItemTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? SettingItemTableViewCell else { fatalError() }
                    cell.onData.onNext(item.name ?? "")
                    return cell
                }
            }
            .disposed(by: bag)
        
    }
}

// MARK: Detail func definition of VC
extension SettingViewController: Storyboarded {
    func layout() {
//        tableView.layer.addBorder([.top], color: UIColor.lightGray, width: 0.6)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 66
        
        let mySettingTableViewCellNib = UINib(nibName: "MySettingTableViewCell", bundle: nil)
        tableView.register(mySettingTableViewCellNib, forCellReuseIdentifier: MySettingTableViewCell.identifier)
        let settingItemTableViewCellNib = UINib(nibName: "SettingItemTableViewCell", bundle: nil)
        tableView.register(settingItemTableViewCellNib, forCellReuseIdentifier: SettingItemTableViewCell.identifier)
    }
}
