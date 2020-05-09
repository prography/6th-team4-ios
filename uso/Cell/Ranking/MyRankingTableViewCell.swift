//
//  MyRankingTableViewCell.swift
//  uso
//
//  Created by 서재훈 on 2020/05/01.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift

class MyRankingTableViewCell: UITableViewCell {
    static let identifier = "MyRankingTableViewCell"
    
    @IBOutlet weak var tempView: UIView!
    
    private let cellBag = DisposeBag()
    
    let onData: AnyObserver<RankingItem>
    var bag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<RankingItem>()
        onData = data.asObserver()
    
        super.init(coder: aDecoder)

        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] ranking in
                //implementation
            })
            .disposed(by: cellBag)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func layout() {
        tempView.backgroundColor = UIColor.systemIndigo
        tempView.layer.cornerRadius = 5
    }
    
}
