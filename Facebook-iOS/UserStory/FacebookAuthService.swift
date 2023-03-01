//
//  FacebookAuthService.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 17/11/22.
//

import FacebookLogin
import FBSDKLoginKit
import Foundation

class FacbookAuthServiceViewModel: FacebookAuthServiceProtocol {
    var loginCompletionHandler: ((Result<LoginManagerLoginResult, Error>) -> Void)?
    var logoutCompletionHandler: (() -> Void)?
    weak var delegate: LogInViewModelDelegate?
    var hasActiveSession: Bool {
        guard let token = AccessToken.current else {
            return false
        }
        return !token.isExpired
    }
    func authDidStart() {
        let loginManager = LoginManager()
        if let _ = AccessToken.current {
            loginManager.logOut()
//            updateButton(isLoggedIn: false)
            logoutCompletionHandler?()
        } else {
            guard let delegate = delegate else {
                return
            }

            loginManager.logIn(permissions: ["public_profile", "email", "user_posts", "user_photos"], from: delegate.getReference()) { [weak self] (result, error) in
                if let error = error {
                    self?.loginCompletionHandler?(.failure(error))
                } else if let result = result {
                    self?.loginCompletionHandler?(.success(result))
                } else {
                    print("Unknown case")
                }
                
                }
            }
        }
    
    func authDidCancel() {
//        guard let result, !result.isCalled else {
            print("User cancelled login")
            return
        }
    
//   func authDidFinish() {
//            self.loginCompletionHandler?(.success(result))
//       }
    }
enum CostumeError: Error {
    case invalidPassword
    case notFound 
    case unexpected(code: Int)
    
}
