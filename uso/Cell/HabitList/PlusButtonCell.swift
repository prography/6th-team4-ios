//
//  PlusButtonCell.swift
//  uso
//
//  Created by Apple on 2020/05/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PlusButtonCell: UITableViewCell {
    static let identifier = "PlussButtonCell"
//    weak var coordinator: MainCoordinator?
    @IBOutlet weak var plusButtonView: UIView!
    @IBOutlet weak var cardView: UIView!
    
    var onData: AnyObserver<HabitItem>
    var bag = DisposeBag()
    
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<HabitItem>()
        onData = data.asObserver()
        
        super.init(coder: aDecoder)
        
        
        data.observeOn(MainScheduler.instance)
        .subscribe(onNext: { [weak self] item in
            
        })
        .disposed(by: bag)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    internal override func prepareForReuse() {
        bag = DisposeBag()
    }
    
}
