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
    @IBOutlet weak var tableView: UITableView!
    var viewModel: HabitListViewBindable!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindRX()
        layout()
    }
    
    func bindRX() {
        let items: Observable<[Any]> = Observable.combineLatest(viewModel.habitList, viewModel.profile) {
            $1+$0
        }
        
        items
            .bind(to: tableView.rx.items) { (tableView, row, item) -> UITableViewCell in
                // 이거 마지막에 + 어떻게 나타낼지 고민해보자
                if row == 0 {
                    guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: ProfileCell.identifier,
                        for: IndexPath.init(row: row, section: 0)) as? ProfileCell
                        else { fatalError() }
                    
                    cell.onData.onNext(item as? Profile ?? Profile(description: "error"))
                    return cell
                } else {
                    guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: HabitListCell.identifier,
                        for: IndexPath.init(row: row, section: 0)) as? HabitListCell
                        else { fatalError() }
                    
                    cell.onData.onNext((item as? HabitItem ?? HabitItem(name: "error", ratio: 0, contributions: [])))
                    return cell
                }
        }.disposed(by: bag)
    }
}

// MARK: Detail func definition of VC
extension HabitListViewController: Storyboarded, UITableViewDelegate {
    
    func layout() {
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        // self.tableView.tableFooterView = PlusButtonCell()
        let habitListCellNib = UINib(nibName: "HabitListCell", bundle: nil)
        self.tableView.register(habitListCellNib, forCellReuseIdentifier: HabitListCell.identifier)
        let profileCellNib = UINib(nibName: "ProfileCell", bundle: nil)
        self.tableView.register(profileCellNib, forCellReuseIdentifier: ProfileCell.identifier)
        let plusButtonView = PlusButton.instanceFromNib()
        tableView.tableFooterView = plusButtonView
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 400
        } else {
            return 60
        }
    }
}
