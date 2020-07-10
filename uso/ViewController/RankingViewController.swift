//
//  RankingViewController.swift
//  uso_ios
//
//  Created by Apple on 2020/04/28.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
//import RxViewController

class RankingViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    weak var coordinator: MainCoordinator?
    let bag = DisposeBag()
    var viewModel = RankingViewModel()
    lazy var input = RankingViewModel.Input(viewModelExecuted: .init(value: .trigger))
    lazy var output = viewModel.transform(input: input)
    var screenWidth = UIScreen.main.bounds.width

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        bindRX()
        
        tableView.delegate = self
    }
    
    private func bindRX() {
//        input.viewModelExecuted
        
        output.rankingItemOutput
            .bind(to: tableView.rx.items) { (tableView, row, item) -> UITableViewCell in
                if row == 0 {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: MyRankingTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? MyRankingTableViewCell else { fatalError() }
                    cell.onData.onNext(item)
                    return cell
                } else {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingItemTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? RankingItemTableViewCell else { fatalError() }
                    cell.onData.onNext(item)
                    return cell
                }
            }
            .disposed(by: bag)
    }
}

// MARK: Detail func definition of VC, UITableView
extension RankingViewController: Storyboarded, UITableViewDelegate {
    func layout() {
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 110
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        let myRankingTableViewCellNib = UINib(nibName: "MyRankingTableViewCell", bundle: nil)
        tableView.register(myRankingTableViewCellNib, forCellReuseIdentifier: MyRankingTableViewCell.identifier)
        let rankingItemTableViewCellNib = UINib(nibName: "RankingItemTableViewCell", bundle: nil)
        tableView.register(rankingItemTableViewCellNib, forCellReuseIdentifier: RankingItemTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return screenWidth*25/32
        } else {
            return screenWidth*7.5/32
        }
    }
}
