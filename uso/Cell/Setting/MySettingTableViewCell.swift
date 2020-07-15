//
//  MySettingTableViewCell.swift
//  uso
//
//  Created by 서재훈 on 2020/07/14.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift

class MySettingTableViewCell: UITableViewCell {
    static let identifier = "MySettingTableViewCell"
    
    @IBOutlet weak var breadImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var numberOfBreadLabel: UILabel!
    @IBOutlet weak var numberOfBreadLabel2: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var roundBackgroundView: UIView!
    @IBOutlet weak var notiView: UIView!
    @IBOutlet weak var notiOnOffSwitch: UISwitch!
    
    let onData: AnyObserver<UserItem>
    var bag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<UserItem>()
        onData = data.asObserver()
    
        super.init(coder: aDecoder)

        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] user in
                self?.nicknameLabel.text = user.name
                let exp = user.exp ?? 0
                let itemTotalCount = user.itemTotalCount ?? 0
                self?.expLabel.text = "\(exp)"
                self?.numberOfBreadLabel.text = "\(itemTotalCount)"
                self?.numberOfBreadLabel2.text = "현재 \(itemTotalCount)개"
                self?.progressView.progress = Float(user.percent ?? 0)
            })
            .disposed(by: bag)
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
        self.contentView.backgroundColor = UIColor(hex: 0xF5F4F1)
        roundBackgroundView.backgroundColor = UIColor.systemBackground
        roundBackgroundView.layer.cornerRadius = 12
        notiView.backgroundColor = UIColor.systemBackground
        notiView.layer.addBorder([.top], color: UIColor.lightGray, width: 0.6)
        notiOnOffSwitch.onTintColor = UIColor(hex: 0xAD9C82)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }
    
}
