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
                let totalRows = tableView.numberOfRows(inSection: 0)
                if row == 0 {
                    guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: ProfileCell.identifier) as? ProfileCell
                        else { fatalError() }
                    cell.onData.onNext(item as? Profile ?? Profile(description: "description"))
                    cell.bakeryButton.rx
                        .tap
                        .subscribe { _ in
                            self.coordinator?.presentBakeryVC()
                    }
                    .disposed(by: self.bag)
                    return cell
                } else if row  == totalRows - 1 {
                    guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: AddHabitCell.identifier) as? AddHabitCell
                        else { fatalError() }
                    return cell
                } else {
                    guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: HabitCell.identifier) as? HabitCell
                        else { fatalError() }
                    cell.onData.onNext((item as? HabitItem ?? HabitItem(name: "error", ratio: 0, contributions: [])))
                    return cell
                }
        }.disposed(by: bag)
        
        tableView.rx
            .itemSelected.subscribe(onNext: { indexPath in
                if indexPath.row == 0 {
                    return
                } else if indexPath.row == indexPath.count {
                    self.coordinator?.presentHabitAddVC()
                } else {
                    self.coordinator?.presentHabitDetailVC()
                }
            })
            .disposed(by: self.bag)
    }
}

// MARK: Detail func definition of VC
extension HabitListViewController: Storyboarded {
    
    func layout() {
        tableView.backgroundColor = UIColor(hex: 0xF5F4F1)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 66
        
        let habitCellNib = UINib(nibName: "HabitCell", bundle: nil)
        self.tableView.register(habitCellNib, forCellReuseIdentifier: HabitCell.identifier)
        let profileCellNib = UINib(nibName: "ProfileCell", bundle: nil)
        self.tableView.register(profileCellNib, forCellReuseIdentifier: ProfileCell.identifier)
        let addHabitCellNib = UINib(nibName: "AddHabitCell", bundle: nil)
        self.tableView.register(addHabitCellNib, forCellReuseIdentifier: AddHabitCell.identifier)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 143
//    }
}
