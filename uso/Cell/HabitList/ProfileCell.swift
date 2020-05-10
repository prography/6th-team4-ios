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
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let onData: AnyObserver<Profile>
    private var bag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        let data = PublishSubject<Profile>()
        onData = data.asObserver()
        
        super.init(coder: aDecoder)
        
        data.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] item in
                self?.descriptionLabel.text = item.description
            })
            .disposed(by: bag)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
