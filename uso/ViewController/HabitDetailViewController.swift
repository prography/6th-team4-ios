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
    var coordinator : Coordinator?
    
    @IBOutlet weak var calendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCalendar()
    }
}

extension HabitDetailViewController: FSCalendarDelegate, FSCalendarDataSource {
    func setCalendar() {
        calendar.allowsMultipleSelection = true
        calendar.delegate = self
        calendar.dataSource = self
    }
}
