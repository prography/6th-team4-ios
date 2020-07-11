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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var numberOfBreadLabel: UILabel!
    @IBOutlet weak var numberOfBreadLabel2: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var notiOnOffSwitch: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notiView: UIView!
    
    weak var coordinator: MainCoordinator?
    var viewModel: SettingViewModel!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindRX()
        layout()
    }
    
    private func bindRX() {
        viewModel.userSubject
            .subscribe(onNext: { [weak self] user in
                self?.nicknameLabel.text = user.name
                let exp = user.exp ?? 0
                let itemTotalCount = user.itemTotalCount ?? 0
                self?.expLabel.text = "\(exp)"
                self?.numberOfBreadLabel.text = "\(itemTotalCount)"
                self?.numberOfBreadLabel2.text = "현재 \(itemTotalCount)개"
                self?.progressView.progress = Float(user.percent ?? 0)
            })
            .disposed(by: bag)
        
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
    func layout() {
        backgroundView.layer.cornerRadius = 12
        
        tableView.layer.addBorder([.top], color: UIColor.lightGray, width: 0.6)
        notiView.backgroundColor = UIColor.systemBackground
        notiView.layer.addBorder([.top], color: UIColor.lightGray, width: 0.6)
        notiOnOffSwitch.onTintColor = UIColor(hex: 0xAD9C82)
        let settingItemTableViewCellNib = UINib(nibName: "SettingItemTableViewCell", bundle: nil)
        tableView.register(settingItemTableViewCellNib, forCellReuseIdentifier: SettingItemTableViewCell.identifier)
    }
}
