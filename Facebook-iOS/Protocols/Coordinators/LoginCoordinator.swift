//
//  LoginCoordinator.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 28/11/22.
//

import Foundation
import UIKit

protocol LoginCoordinatorProtocol: CoordinatorProtocol {
    func showLoginViewController()
}

class LoginCoordinator: LoginCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
       
    var childCoordinators: [CoordinatorProtocol] = []
       
    var type: CoordinatorType { .login }
    
    required init(_ navigationController: UINavigationController) {
            self.navigationController = navigationController
        }
    
    func start() {
           showLoginViewController()
       }
    
    deinit {
           print("LoginCoordinator deinit")
       }
    
    func showLoginViewController() {
            let loginVC: LogInViewController = .init()
            loginVC.didSendEventClosure = { [weak self] _ in
                self?.finishDelegate?.didFinish(child: self)
            } 
        if loginVC.fbAuthViewModel.hasActiveSession {
            self.finishDelegate?.didFinish(child: self)
        } else {
            navigationController.pushViewController(loginVC, animated: true)
        }
    
    }
}
