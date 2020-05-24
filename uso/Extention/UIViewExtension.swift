//
//  UIViewExtension.swift
//  uso
//
//  Created by sooyong on 2020/05/24.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import Toast_Swift

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        _ = views.map { self.addSubview($0) }
    }
    
    func setBorder(color: UIColor, width: CGFloat, cornerRadius: CGFloat = 0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func setShadow(color: UIColor, opacity: Float, size: CGSize) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = size
        self.layer.shadowOpacity = opacity
        self.clipsToBounds = false
    }
    
    func basicToast(message: String) {
        self.makeToast(message)
    }
    
    func showToast(message: String, duration: TimeInterval = Constants.TOAST_DURATION, positionNum: Int = 1) {
        // 가끔 토스트 배경색이 투명으로 나오는 경우가 있음
        var toastStyle = ToastStyle()
        toastStyle.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        switch positionNum {
        case 0:
            self.makeToast(message, duration: duration, position: .top, style: toastStyle)
        case 1:
            self.makeToast(message, duration: duration, position: .center, style: toastStyle)
        case 2:
            self.makeToast(message, duration: duration, position: .bottom, style: toastStyle)
        default:
            break
        }
    }
    
    func showToastView(title: String, message: String, duration: TimeInterval, point: CGPoint, image: UIImage) {
        self.makeToast(message, duration: duration, point: point, title: title, image: image) { didTap in
            if didTap {
                print("completion from tap")
            } else {
                print("completion without tap")
            }
        }
    }
    
    func showToastActivitySpinner() {
        self.makeToastActivity(.center)
    }
    
    func showToastTargetView(view: UIView) {
        self.showToast(view)
    }
    
    func hideAllToast() {
        self.hideAllToasts()
    }
    
    //뷰 bottom에 밑줄 생성
    func addBorderBottom(width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height - height, width: width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
    
    //뷰 right에 선 생성
    func addBorderRight(y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: self.frame.width - width, y: y, width: width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
    //뷰 left에 선 생성
    func addBorderLeft(y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: y, width: width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
    
    func addColors(colors: [UIColor], withPercentage percentages: [Double]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        
        var colorsArray: [CGColor] = []
        var locationsArray: [NSNumber] = []
        var total = 0.0
        locationsArray.append(0.0)
        
        colors.enumerated().forEach { (index, color) in
            // append same color twice
            colorsArray.append(color.cgColor)
            colorsArray.append(color.cgColor)
            // Calculating locations w.r.t Percentage of each
            if index + 1 < percentages.count {
                total += percentages[index]
                let location: NSNumber = NSNumber(value: total/100)
                locationsArray.append(location)
                locationsArray.append(location)
            }
        }
        
        locationsArray.append(1.0)
        gradientLayer.colors = colorsArray
        gradientLayer.locations = locationsArray
        
        self.backgroundColor = .clear
        self.layer.addSublayer(gradientLayer)
    }
    
    func setRoundCorner(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    static func loadFromXib<T>(withOwner: Any? = nil, options: [UINib.OptionsKey: Any]? = nil) -> T where T: UIView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
}
