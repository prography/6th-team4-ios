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
    var viewModel: RankingViewBindable!
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        let myRankingTableViewCellNib = UINib(nibName: "MyRankingTableViewCell", bundle: nil)
        tableView.register(myRankingTableViewCellNib, forCellReuseIdentifier: MyRankingTableViewCell.identifier)
        let rankingItemTableViewCellNib = UINib(nibName: "RankingItemTableViewCell", bundle: nil)
        tableView.register(rankingItemTableViewCellNib, forCellReuseIdentifier: RankingItemTableViewCell.identifier)
        
        bind()
    }
    
    private func bind() {
        // 테이블뷰 아이템들
        viewModel.allRankings
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

// MARK: Detail func definition of VC
extension RankingViewController: Storyboarded {
}

// MARK: UITableView
extension RankingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 350
        } else {
            return 100
        }
    }
}
