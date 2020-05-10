//
//  PlusButtonCell.swift
//  uso
//
//  Created by Apple on 2020/05/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

class PlusButton: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "PlusButton", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
