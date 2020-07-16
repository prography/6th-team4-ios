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
    @IBOutlet var nickName: UILabel!
    @IBOutlet var exp: UILabel!
    @IBOutlet var achieve: UILabel!
    @IBOutlet var crownImage: UIImageView!
    
    let onData: AnyObserver<RankingItem>
    private let cellDisposeBag = DisposeBag()
    var bag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<RankingItem>()
        onData = data.asObserver()
    
        super.init(coder: aDecoder)

        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] ranking in
                if ranking.rank == "1" {
                    self?.crownImage.isHidden = false
                    self?.crownImage.image = UIImage(named: "gold_crown")
                } else if ranking.rank == "2" {
                    self?.crownImage.isHidden = false
                    self?.crownImage.image = UIImage(named: "silver_crown")
                }
                self?.rank.text = "\(ranking.rank)"
                self?.nickName.text = ranking.userName
                self?.exp.text = "\(ranking.exp)"
                self?.achieve.text = "\(ranking.achievement)%"
            })
            .disposed(by: cellDisposeBag)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        crownImage.isHidden = true
        bag = DisposeBag()
    }
    
}
