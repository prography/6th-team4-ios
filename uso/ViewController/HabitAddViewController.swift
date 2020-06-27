//
//  HabitAddViewController.swift
//  uso
//
//  Created by sooyong on 2020/05/16.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HabitAddViewController: UIViewController {
    @IBOutlet var breadNameField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var sunView: UIView!
    @IBOutlet var monView: UIView!
    @IBOutlet var tueView: UIView!
    @IBOutlet var wedView: UIView!
    @IBOutlet var thrView: UIView!
    @IBOutlet var friView: UIView!
    @IBOutlet var satView: UIView!
    @IBOutlet var alarmSwitch: UISwitch!
    @IBOutlet var timePicker: UIDatePicker!
    
    var dayBoolArr = [Bool](repeating: false, count: 7)
    var dayViewArr: [UIView] = []
    weak var coordinator: MainCoordinator?
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayViewArr.append(sunView)
        dayViewArr.append(monView)
        dayViewArr.append(tueView)
        dayViewArr.append(wedView)
        dayViewArr.append(thrView)
        dayViewArr.append(friView)
        dayViewArr.append(satView)

        layout()
    }

    func bindRX() {
//        for (i, v) in dayViewArr.enumerated() {
//            v.rx.
//        }
        alarmSwitch.rx.controlEvent(.touchDown).subscribe { _ in
            print("tap")
        }.disposed(by: bag)
    }

//    @IBAction func tapDay(_ sender: UIView) {
//
//    }
}

extension HabitAddViewController: Storyboarded {
    func layout() {
        breadNameField.addBorderBottom(width: breadNameField.bounds.width, height: 1, color: UIColor.label)
        descriptionField.addBorderBottom(width: breadNameField.bounds.width, height: 1, color: UIColor.label)
        dayViewArr.forEach {
            $0.backgroundColor = UIColor(hex: 0xAD9C82)
            $0.layer.cornerRadius = $0.bounds.width/2
        }
        alarmSwitch.onTintColor = UIColor(hex: 0xAD9C82)
    }
}
