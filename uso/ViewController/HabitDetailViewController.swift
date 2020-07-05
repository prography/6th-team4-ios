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

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
