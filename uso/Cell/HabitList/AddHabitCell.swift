//
//  AddHabitCell.swift
//  uso
//
//  Created by sooyong on 2020/06/27.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

class AddHabitCell: UITableViewCell {
    static let identifier = "AddHabitCell"
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var plusButton: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        layout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func layout() {
        self.contentView.backgroundColor = UIColor(hex: 0xF5F4F1)
        plusButton.backgroundColor = UIColor(hex: 0xC2BDB9)
        plusButton.layer.cornerRadius = plusButton.bounds.width/2
        cardView.backgroundColor = UIColor(hex: 0xD2CFC9)
        cardView.layer.cornerRadius = 12
        descriptionLabel.textColor = UIColor(hex: 0x493E37)
    }
}
