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

class HabitAddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var doneButton:UIButton!
    @IBOutlet var breadNameField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var sunView: UIButton!
    @IBOutlet var monView: UIButton!
    @IBOutlet var tueView: UIButton!
    @IBOutlet var wedView: UIButton!
    @IBOutlet var thrView: UIButton!
    @IBOutlet var friView: UIButton!
    @IBOutlet var satView: UIButton!
    @IBOutlet var alarmSwitch: UISwitch!
    @IBOutlet var timePicker: UIDatePicker!
    
    var dayBoolArr = [Bool](repeating: false, count: 7)
    var dayViewArr: [UIButton] = []
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
        breadNameField.delegate = self
        descriptionField.delegate = self

        bindRX()
        layout()
    }

    func bindRX() {
        cancelButton.rx
            .tap
            .subscribe { _ in
                self.dismiss(animated: true, completion: nil)
            }
            .disposed(by: bag)
        
        doneButton.rx
            .tap
            .subscribe { _ in
                //API로 POST
                guard let habitTitle = self.breadNameField.text else { return }
                var habitAlarmTime: String?
                if self.alarmSwitch.isOn {
                    habitAlarmTime = self.convertDateToTime()
                }
                AddHabitAPI.searchWithSwift(newHabit: NewHabit(title: habitTitle, category: "기타", description: self.descriptionField.text, dayOfWeek: self.convertDayBoolToNumString(), alarmTime: habitAlarmTime))
                self.dismiss(animated: true, completion: nil)
            }
            .disposed(by: bag)
        
        alarmSwitch.rx
            .isOn
            .subscribe(onNext : {
                self.timePicker.isHidden = !$0
            })
            .disposed(by: bag)
    }

    @IBAction func tapDay(_ sender: UIButton) {
        guard let index = dayViewArr.firstIndex(of: sender) else {return}
        self.dayBoolArr[index].toggle()

        if self.dayBoolArr[index] {
            sender.backgroundColor = UIColor(hex: 0x4C7A65)
            let label = sender.subviews.first as? UILabel
            label?.textColor = UIColor.white
        } else {
            sender.backgroundColor = UIColor.white
            let label = sender.subviews.first as? UILabel
            label?.textColor = UIColor.black
        }
    }
    
    private func convertDateToTime() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
        
        let dateStr = dateformatter.string(from: timePicker.date).components(separatedBy: " ")
        let timeStr = dateStr[0].components(separatedBy: ":")
        var hourStr = timeStr[0]
        let minuStr = timeStr[1]
        
        if dateStr[1] == "PM" {
            hourStr = String(((Int(hourStr) ?? 0) + 12)%24)
        } else if hourStr.count < 2 {
            hourStr = "0" + hourStr
        }

        return hourStr + ":" + minuStr
    }
    
    private func convertDayBoolToNumString() -> String {
        var numString = ""
        dayBoolArr.map {
            if $0 == true {
                numString += "1"
            } else {
                numString += "0"
            }
        }
        return numString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension HabitAddViewController: Storyboarded {
    func layout() {
        self.view.backgroundColor = UIColor(hex: 0xF5F4F1)
        breadNameField.addBorderBottom(width: breadNameField.bounds.width, height: 1, color: UIColor.lightGray)
        descriptionField.addBorderBottom(width: breadNameField.bounds.width, height: 1, color: UIColor.lightGray)
        dayViewArr.forEach {
            $0.backgroundColor = UIColor.white
            $0.layer.cornerRadius = $0.bounds.width/2
        }
        alarmSwitch.onTintColor = UIColor(hex: 0x4C7A65)
    }
}
