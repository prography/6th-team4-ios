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
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var plusButton: UIButton!
    var bag = DisposeBag()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal override func prepareForReuse() {
        bag = DisposeBag()
    }
    
}
