//
//  Storyboarded.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboardName: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    // Instantiate VC with id, VC is only one for each storyboard
    static func instantiate(storyboardName: String) -> Self {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
}
