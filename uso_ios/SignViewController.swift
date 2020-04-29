//
//  ViewController.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SignViewController: UIViewController {
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    
    // Use delegate pattern for using coordinator from VC
    // ViewModel should be set from coordinator
    weak var coordinator: MainCoordinator?
    var viewModel: SignViewBindable!
    let bag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        layout()
    }
    
    // Collection of view model binded data
    private func bind() {
        viewModel.number
            .map { String($0) }
            .bind(to:numberLabel.rx.text)
            .disposed(by: bag)
        
        plusButton.rx
            .tap
            .subscribe{ _ in
                do {
                    let val = try self.viewModel.number.value()
                    self.viewModel.number.onNext(val + 1)
                } catch {
                    print(UsoError.getRepositoryError)
                }
        }.disposed(by: bag)
        
        minusButton.rx
            .tap
            .subscribe{ _ in
                do {
                    let val = try self.viewModel.number.value()
                    self.viewModel.number.onNext(val - 1)
                } catch {
                    print(UsoError.getRepositoryError)
                }
        }.disposed(by: bag)
    }
    
    // Layout definition of RootVC
    private func layout() {
        navigateButton.rx
            .tap
            .subscribe{ _ in
                self.coordinator?.presentMainTabVC()
        }
        .disposed(by: bag)
    }
}

//MARK: Detail func definition of VC
extension SignViewController: Storyboarded {
    
}
