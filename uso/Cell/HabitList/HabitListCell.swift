//
//  HabitListCellTableViewCell.swift
//  uso
//
//  Created by Apple on 2020/05/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

class HabitListCell: UITableViewCell {
    static let identifier = "HabitListCell"
    @IBOutlet weak var habitTitleLabel: UILabel!
    @IBOutlet weak var ratioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
}
