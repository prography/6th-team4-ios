//
//  HabitListViewController.swift
//  uso_ios
//
//  Created by Apple on 2020/04/28.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HabitListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    weak var coordinator: MainCoordinator?
    var viewModel: HabitListViewBindable!
    let bag = DisposeBag()
    
    @IBOutlet weak var bakeryView: UIView!
    @IBOutlet weak var todayMessageTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindRX()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.navigationController.navigationBar.isHidden = true
    }
    
    func bindRX() {
        let items: Observable<[Any]> = Observable.combineLatest(viewModel.habitList, viewModel.profile) {
            $1+$0
        }
        
        items
            .bind(to: tableView.rx.items) { (tableView, row, item) -> UITableViewCell in
                // 이거 마지막에 + 어떻게 나타낼지 고민해보자
                let totalRows = tableView.numberOfRows(inSection: 0)
                if row == 0 {
                    guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: HabitListCell.identifier,
                        for: IndexPath.init(row: row, section: 0)) as? HabitListCell
                        else { fatalError() }
                    
                    cell.onData.onNext((item as? HabitItem ?? HabitItem(name: "error", ratio: 0, contributions: [])))
                    return cell
                } else if row  == totalRows - 1 {
                    guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: PlusButtonCell.identifier,
                        for: IndexPath.init(row: row, section: 0)) as? PlusButtonCell
                        else { fatalError() }
                    
                    return cell
                    
                } else {
                    guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: HabitListCell.identifier,
                        for: IndexPath.init(row: row, section: 0)) as? HabitListCell
                        else { fatalError() }
                    cell.parentVC = self
                    cell.onData.onNext((item as? HabitItem ?? HabitItem(name: "error", ratio: 0, contributions: [])))
                    return cell
                }
        }.disposed(by: bag)
        
        tableView.rx
            .itemSelected.subscribe(onNext: { indexPath in
                if indexPath.row == indexPath.count {
                    self.coordinator?.presentHabitAddVC()
                } else {
                    self.coordinator?.presentHabitDetailVC()
                }
            })
            .disposed(by: self.bag)
    }
}

// MARK: Detail func definition of VC
extension HabitListViewController: Storyboarded, UITableViewDelegate {
    
    func layout() {
        tableView.rx
            .setDelegate(self)
            .disposed(by: self.bag)
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 800
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        let habitListCellNib = UINib(nibName: "HabitListCell", bundle: nil)
        self.tableView.register(habitListCellNib, forCellReuseIdentifier: HabitListCell.identifier)
        let profileCellNib = UINib(nibName: "ProfileCell", bundle: nil)
        self.tableView.register(profileCellNib, forCellReuseIdentifier: ProfileCell.identifier)
        let plusButtonCellNib = UINib(nibName: "PlusButtonCell", bundle: nil)
        self.tableView.register(plusButtonCellNib, forCellReuseIdentifier: PlusButtonCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 143
    }
}
