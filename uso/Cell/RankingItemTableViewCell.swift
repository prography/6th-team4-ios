//
//  RankingItemTableViewCell.swift
//  uso
//
//  Created by 서재훈 on 2020/04/30.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift

class RankingItemTableViewCell: UITableViewCell {
    static let identifier = "RankingItemTableViewCell"
    
    @IBOutlet var rank: UILabel!
    @IBOutlet var charactor: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var rate: UILabel!
    @IBOutlet var hours: UILabel!
    @IBOutlet var hashTag: UILabel!
    
    private let cellBag = DisposeBag()
    
    let onData: AnyObserver<RankingItem>
    var bag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<RankingItem>()
        onData = data.asObserver()
    
        super.init(coder: aDecoder)

        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] ranking in
                self?.rank.text = "\(ranking.rank)"
                self?.name.text = ranking.name
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }
    
    func layout() {
        hashTag.backgroundColor = UIColor.lightGray
        hashTag.clipsToBounds = true
        hashTag.layer.cornerRadius = 5
    }

}
