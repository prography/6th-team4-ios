//
//  SettingItemTableViewCell.swift
//  uso
//
//  Created by 서재훈 on 2020/05/17.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift

class SettingItemTableViewCell: UITableViewCell {
    static let identifier = "SettingItemTableViewCell"
    
    @IBOutlet var label: UILabel!
    
    let onData: AnyObserver<String>
    var bag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<String>()
        onData = data.asObserver()
    
        super.init(coder: aDecoder)

        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] setting in
                self?.label?.text = setting
            })
            .disposed(by: bag)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        layout()
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
        self.layer.addBorder([.top, .bottom], color: UIColor.gray, width: 1.0)
    }
    
}
