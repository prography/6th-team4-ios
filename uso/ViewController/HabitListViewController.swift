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
        viewModel.habitList
            .bind(to: tableView.rx.items) { (tableView, row, item) -> UITableViewCell in
            // 넘겨주는 값이 list 면 괜찮을거 같다. 이걸 일단 list 로 주고
            // 어떤 방식으로 줄지 한번 고민해보자
                
        }.disposed(by: bag)
    }
}

// MARK: Detail func definition of VC
extension HabitListViewController: Storyboarded {
    func layout() {
        let habitListCellNib = UINib(nibName: "HabitListCell", bundle: nil)
        tableView.register(habitListCellNib, forCellReuseIdentifier: HabitListCell.identifier)
        let profileCellNib = UINib(nibName: "ProfileCell", bundle: nil)
        tableView.register(profileCellNib, forCellReuseIdentifier: ProfileCell.identifier)
        let plusButtonCellNib = UINib(nibName: "PlusButtonCell", bundle: nil)
        tableView.register(plusButtonCellNib, forCellReuseIdentifier: PlusButtonCell.identifier)
        
    }
}
