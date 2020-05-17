//
//  SettingViewController.swift
//  uso_ios
//
//  Created by Apple on 2020/04/28.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift

class SettingViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    weak var coordinator: SettingCoordinator?
    var viewModel: SettingViewModel!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settingItemTableViewCellNib = UINib(nibName: "SettingItemTableViewCell", bundle: nil)
        tableView.register(settingItemTableViewCellNib, forCellReuseIdentifier: SettingItemTableViewCell.identifier)
        
        bindRX()
    }
    
    private func bindRX() {
        // 테이블뷰 아이템들
        viewModel.allSettings
            .bind(to: tableView.rx.items) { (tableView, row, item) -> UITableViewCell in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingItemTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? SettingItemTableViewCell else { fatalError() }
                cell.onData.onNext(item)
                return cell 
            }
            .disposed(by: bag)
    }

}

// MARK: Detail func definition of VC
extension SettingViewController: Storyboarded {
}
