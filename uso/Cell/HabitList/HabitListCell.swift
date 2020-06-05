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
    var parentVC: HabitListViewController?
    @IBOutlet weak var habitTitleLabel: UILabel!
    @IBOutlet weak var ratioLabel: UILabel!
    @IBOutlet weak var totalView: UIView!
    
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
        
    }
    
    func layout() {
        let tapGesture = UITapGestureRecognizer()
        totalView.addGestureRecognizer(tapGesture)
        tapGesture.rx
            .event
            .bind(onNext: { _ in
            self.parentVC?.coordinator?.presentHabitDetailVC()
        }).disposed(by: bag)
        
        //totalView.setRoundCorner(20)
        totalView.setBorder(color: UIColor(red: 0.742, green: 0.722, blue: 0.668, alpha: 1), width: 1, cornerRadius: 20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }
}
