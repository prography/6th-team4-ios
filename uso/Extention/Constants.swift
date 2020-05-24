//
//  Constants.swift
//  uso
//
//  Created by sooyong on 2020/05/24.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit

class Constants {

    static let DEVICE_TYPE: String = "I"    //IPHONE

    //화면크기에 관한 변수
    static let DEVICE_WIDTH: CGFloat = UIScreen.main.bounds.size.width
    static let DEVICE_HEIGHT: CGFloat = UIScreen.main.bounds.size.height
    static let DEVICE_CENTER_X: CGFloat = UIScreen.main.bounds.size.width / 2
    static let DEVICE_CENTER_Y: CGFloat = UIScreen.main.bounds.size.height / 2
    static let DEVICE_RATIO: CGFloat = Constants.DEVICE_WIDTH / 375
    static let DEVICE_RATIO_WIDTH: CGFloat = Constants.DEVICE_WIDTH - 53 * Constants.DEVICE_RATIO * 2

    //tag
    static let LOCAL_NOTI_INSPECT_SCHEDULE: Int = 20
    static let FCM_PUSH_NOTI: Int = 21
    static let INDICATORVIEW_TAG: Int = 101


    //Timer
    static let TOAST_DURATION: TimeInterval = 2.0
    static let CERTIFY_TIMER_SEC: Int = 180


    //1회용 혹은 다시보지않기가 존재하는 팝업,알럿 UserDefaults 키
    static let MAIN_POPUP_AD_VIEW_DATE: String = "MAIN_POPUP_AD_VIEW_DATE"
    static let MAIN_POPUP_AD_VIEW_CODE: String = "MAIN_POPUP_AD_VIEW_CODE"

    static let USER_ACCESS_TOKEN: String = "USER_ACCESS_TOKEN"
    static let NOTI_PERMISSION: String = "NOTI_PERMISSION"
    static let NOTI_INSPECT_SCHEDULE: String = "NOTI_INSPECT_SCHEDULE"
}
