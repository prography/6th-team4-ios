//
//  IndicatorView.swift
//  Fitpet_iOS_V2
//
//  Created by kaco on 21/12/2018.
//  Copyright © 2018 FItpet. All rights reserved.
//

import UIKit
import Toast_Swift

class IndicatorView: UIView {

    static let shared = IndicatorView()

    var isBlockView: Bool = true      //전체 화면 덮는 로딩뷰인지?

    private var keyWindow: UIWindow? {
        return UIApplication.shared.windows.first
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: Constants.DEVICE_WIDTH, height: Constants.DEVICE_HEIGHT)
        self.tag = Constants.INDICATORVIEW_TAG
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {
        print("deinit IndicatorView")   //불러오는 부분에서 전역으로 설정 안해놔서 두번 호출되는 것 같지만 무시하고 넘어감
    }

    //MAKR: - Toast Indicator View Set/Remove

    /// indicatorView 추가 함수
    /// - parameter 없음: 없음
    /// - returns:
    func addIndicatorView() {
        guard let window = keyWindow else { return }
        guard !window.subviews.contains(self) else { return }

        // create a new style
        var style = ToastStyle()

        if self.isBlockView {
            style.activityBackgroundColor = UIColor.clear
            style.backgroundColor = .clear  //전체화면 블럭일 경우 인디케이터 중앙에 검은점 안뜨게 style 자체 배경색 없앰
            self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            DispatchQueue.main.async {
                window.addSubview(self)
            }

        } else {
            style.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            style.activityBackgroundColor = UIColor.black.withAlphaComponent(0.5)
        }

        // or perhaps you want to use this style for all toasts going forward?
        // just set the shared style and there's no need to provide the style again
        ToastManager.shared.style = style
        self.showToastActivitySpinner()
    }

    /// indicatorView 제거 함수
    /// - parameter 없음: 없음
    /// - returns:
    func removeIndicatorView() {
        let subViewsArr = UIApplication.shared.keyWindow?.subviews
        guard let subViews = subViewsArr else { return }

        subViews.forEach {
            if $0.tag == Constants.INDICATORVIEW_TAG {
                $0.hideAllToast()
                $0.removeFromSuperview()

                //ToastManager.shared.style 색상 초기화
                var style = ToastStyle()
                style.backgroundColor = UIColor.black.withAlphaComponent(0.8)
                ToastManager.shared.style = style
            }
        }
    }

    // MARK: - Set Inspect Indicator
    func addInspectIndicator(indicatorImageView: UIImageView) {
        var loadingImgArray = [UIImage]() //loading 이미지 배열
        for i in 1...7 {
            loadingImgArray.append(UIImage(named: String(format: "loading_0%d.png", i))!)
        }
        indicatorImageView.animationImages = loadingImgArray
        indicatorImageView.animationDuration = 0.7
        indicatorImageView.startAnimating()
    }
}
