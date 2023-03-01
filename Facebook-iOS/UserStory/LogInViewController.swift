//
//  LogInViewController.swift
//  Facebook-iOS
//
//  Created by Serhii Liamtsev on 4/15/22.
//

import FacebookLogin
import FBSDKLoginKit
import JGProgressHUD
import MBProgressHUD
import UIKit

final class LogInViewController: UIViewController {
    
    var fbAuthViewModel = FacbookAuthServiceViewModel()
    
    var didSendEventClosure: ((LogInViewController.Event) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fbAuthViewModel.delegate = self
        fbAuthViewModel.loginCompletionHandler = { [weak self] result in
            switch result {
                
            case .success(let data):
                guard !data .isCancelled else {
                    return
                }
                self?.didSendEventClosure?(.login)
            case .failure(let error):
                print("Failure: \(error.localizedDescription) ")
            }
        }
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = UIColor.systemBackground
        // logo image
        let logo = UIImage(named: "loginLogo")
        let logoView = UIImageView(image: logo)
        logoView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(logoView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 129),
            logoView.heightAnchor.constraint(equalToConstant: 163),
            logoView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 133),
            logoView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: 321)
        ])

        // login Button
        let loginButton = FBLoginButton()
        loginButton.permissions = ["public_profile", "email", "user_posts", "user_photos"]
        //        loginButton.center = view.center
        loginButton.frame = CGRect(x: 0, y: 0, width: 301, height: 52)
        loginButton.layer.cornerRadius = 50
        loginButton.delegate = self
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 52),
            loginButton.widthAnchor.constraint(equalToConstant: 301),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 751)
        ])
    }

    deinit { print("LoginViewController deinit") }
    
    // progress bar
    func progressBar() {
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 3.0)

    }
}

extension LogInViewController {
    enum Event {
        case login
    }
}

extension LogInViewController: LogInViewModelDelegate {
    func getReference() -> LogInViewController {
        return self
    }
}

extension LogInViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if result?.token != nil {
            didSendEventClosure?(.login)
        }
    }

    func loginButtonDidLogOut(_ loginButton: FBLoginButton) { }
}
