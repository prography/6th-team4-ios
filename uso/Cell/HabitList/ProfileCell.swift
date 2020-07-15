//
//  ProfileCell.swift
//  uso
//
//  Created by Apple on 2020/05/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileCell: UITableViewCell {
    static let identifier = "ProfileCell"
    @IBOutlet weak var bakeryButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let onData: AnyObserver<Profile>
    private var bag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<Profile>()
        onData = data.asObserver()
        
        super.init(coder: aDecoder)
        
        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] item in
                //self?.descriptionLabel.text = item.description
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
        bakeryButton.backgroundColor = UIColor.systemBackground
        bakeryButton.layer.cornerRadius = bakeryButton.bounds.width/2
        bakeryButton.layer.borderWidth = 1
        bakeryButton.layer.borderColor = UIColor(hex: 0x787877).cgColor
    }
    
}
