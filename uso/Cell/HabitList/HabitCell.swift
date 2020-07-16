//
//  HabitCell.swift
//  uso
//
//  Created by 서재훈 on 2020/07/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift

class HabitCell: UITableViewCell {
    static let identifier = "HabitCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    //월화수목금토일
    
    let onData: AnyObserver<HabitItem>
    private let cellDisposeBag = DisposeBag()
    var bag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<HabitItem>()
        onData = data.asObserver()
        
        super.init(coder: aDecoder)
        
        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] item in
                self?.titleLabel.text = item.name
                self?.descriptionLabel.text = "\(item.ratio)"
//                item.
            })
            .disposed(by: cellDisposeBag)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
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
        self.backgroundColor = UIColor(hex: 0xF5F4F1)
        cardView.backgroundColor = UIColor.systemBackground
        cardView.layer.cornerRadius = 12
    }
    
}
