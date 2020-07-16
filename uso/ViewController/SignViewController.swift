//
//  ViewController.swift
//  uso_ios
//
//  Created by Apple on 2020/04/15.
//  Copyright © 2020 sooyong. All rights reserved.
//

import UIKit
import GoogleSignIn
import RxSwift
import RxCocoa
import AuthenticationServices

enum LoginType: String {
    case google = "G"
    case apple  = "A"
}

class SignViewController: UIViewController {
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    @IBOutlet weak var appleLoginView: UIView!
    @IBOutlet weak var googleLoginButtonView: GIDSignInButton!
    
    let appleLoginBtn = ASAuthorizationAppleIDButton(type: .continue, style: .whiteOutline)
    
    // zedd님 트러블슈팅 한거 보고 따라해보기
    // 일단은 google Login Button이 일단 안먹는거 같음
    // 버튼 먹게 한다음에 client or reserved id 를 맞춰준다면
    // 기본 로직은 맞다고 보면 된다.
    
    
    
    // Use delegate pattern for using coordinator from VC
    // ViewModel should be set from coordinator
    weak var coordinator: MainCoordinator?
    var viewModel: SignViewBindable!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        layout()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    // Collection of view model binded data
    private func bind() {
        viewModel.number
            .map { String($0) }
            .bind(to: numberLabel.rx.text)
            .disposed(by: bag)
        
        plusButton.rx
            .tap
            .subscribe { _ in
                do {
                    let val = try self.viewModel.number.value()
                    GIDSignIn.sharedInstance()?.signIn()
                    
                } catch {
                    print(UsoError.getRepositoryError)
                }
        }.disposed(by: bag)
        
        minusButton.rx
            .tap
            .subscribe { _ in
                do {
                     GIDSignIn.sharedInstance()?.signIn()
                } catch {
                    print(UsoError.getRepositoryError)
                }
        }.disposed(by: bag)
    }
    
    // Layout definition of RootVC
    private func layout() {
        appleLoginBtn.cornerRadius = 0
        appleLoginBtn.translatesAutoresizingMaskIntoConstraints = false
        appleLoginView.addSubview(appleLoginBtn)
        appleLoginBtn.topAnchor.constraint(equalTo: appleLoginView.topAnchor).isActive = true
        appleLoginBtn.bottomAnchor.constraint(equalTo: appleLoginView.bottomAnchor).isActive = true
        appleLoginBtn.leftAnchor.constraint(equalTo: appleLoginView.leftAnchor).isActive = true
        appleLoginBtn.rightAnchor.constraint(equalTo: appleLoginView.rightAnchor).isActive = true
        
        appleLoginBtn.addTarget(self, action: #selector(appleLogin), for: .touchUpInside)
        
        navigateButton.rx
            .tap
            .subscribe { _ in
                self.coordinator?.presentMainTabVC()
        }
        .disposed(by: bag)
    }
    
    @objc fileprivate func appleLogin() {
        
        let request = [ASAuthorizationAppleIDProvider().createRequest()]
        let authController = ASAuthorizationController(authorizationRequests: request)
        authController.delegate = self
        authController.performRequests()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
        // ...
        return
      }
        
      guard let authentication = user.authentication else { return }
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        
        
    }
}

// MARK: Detail func definition of VC
extension SignViewController: Storyboarded {
}

extension SignViewController:
ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        // TODO
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userEmail = credential.email ?? ""
            let authCode =  credential.authorizationCode as? String ?? ""
            let familyName = credential.fullName?.familyName ?? ""
            let givenName = credential.fullName?.givenName ?? ""
            let userIdentifier = credential.user
            let token = credential.identityToken
            print("userIdentifier", credential.authorizationCode!)
            print("userEmail: ",userEmail)
            print("familyName: ",familyName)
            print("givenName: ",givenName)
            let userID = UserID.init(name: UserName.init(lastName: givenName, firstName: ""))
            let user = UserComponent.init(code: authCode, user: userID)
            UserAPI.appleLoginRequest(user) { response in
                
                print(response)
                
                self.coordinator?.presentMainTabVC()
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // handle error
        
    }
}
