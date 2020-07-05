//
//  HabitDetailViewController.swift
//  uso
//
//  Created by sooyong on 2020/06/05.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import FSCalendar

class HabitDetailViewController: UIViewController, Storyboarded {

    @IBOutlet weak var commitButtonView: UIView!
    @IBOutlet weak var habitTitleLabl: UILabel!
    @IBOutlet weak var habitCalendar: FSCalendar!
    @IBOutlet weak var habitDescriptionLabel: UILabel!
    @IBOutlet weak var continousCountLabel: UILabel!
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    
    var coordinator: Coordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        setCalendar()
        layout()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.navigationController.navigationBar.isHidden = true
    }
    
    func layout() {
        commitButton.layer.cornerRadius = 8
        commitButton.setShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.25), opacity: 1, size: CGSize(width: 0, height: 2))
    }
}

extension HabitDetailViewController: FSCalendarDelegate, FSCalendarDataSource {
    func setCalendar() {
        calendar.allowsMultipleSelection = true
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    // 날짜 선택 시 콜백 메소드
        public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            print(dateFormatter.string(from: date))
        }
     
        // 날짜 선택 해제 시 콜백 메소드
        public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            print(dateFormatter.string(from: date))
        }
}
