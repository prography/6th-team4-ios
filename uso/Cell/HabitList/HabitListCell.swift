//
//  HabitListCellTableViewCell.swift
//  uso
//
//  Created by Apple on 2020/05/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HabitListCell: UITableViewCell {
    static let identifier = "HabitListCell"
    
    @IBOutlet weak var habitTitleLabel: UILabel!
    @IBOutlet weak var ratioLabel: UILabel!
    
    let onData: AnyObserver<HabitItem>
    private var bag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<HabitItem>()
        onData = data.asObserver()
        
        super.init(coder: aDecoder)
        
        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] item in
                self?.habitTitleLabel.text = item.name
                self?.ratioLabel.text = "\(item.ratio)"
            })
            .disposed(by: bag)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layout()
        // Initialization code
    }
    
    func layout() {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }
}
