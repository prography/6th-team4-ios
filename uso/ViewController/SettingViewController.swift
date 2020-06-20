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
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var expLabel: UILabel!
    @IBOutlet var numberOfBreadLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var notiOnOffSwitch: UISwitch!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var notiView: UIView!
    
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
                self?.expLabel.text = "\(exp)"
                self?.numberOfBreadLabel.text = "\(exp/10 + 1)개"
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
        tableView.layer.addBorder([.top], color: UIColor.lightGray, width: 0.6)
        notiView.backgroundColor = UIColor.white
        notiView.layer.addBorder([.top], color: UIColor.lightGray, width: 0.6)
        progressView.frame = CGRect(origin: .zero, size: CGSize(width: 0, height: 4))
        progressView.backgroundColor = .black
        let settingItemTableViewCellNib = UINib(nibName: "SettingItemTableViewCell", bundle: nil)
        tableView.register(settingItemTableViewCellNib, forCellReuseIdentifier: SettingItemTableViewCell.identifier)
    }
}
