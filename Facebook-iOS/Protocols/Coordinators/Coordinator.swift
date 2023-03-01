//
//  Coordinator.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 09/11/22.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    func start()
    func finish()
    init(_ navigationController: UINavigationController)
    
}

extension CoordinatorProtocol {
    func finish() {
        childCoordinators.removeAll()
    }
}

enum CoordinatorType {
    case app, login, tab
}

protocol AppCoordinatorProtocol: CoordinatorProtocol {
    func showLoginFlow()
    func showMainFlow()
    
}

class AppCoordinator: AppCoordinatorProtocol, CoordinatorFinishDelegate {
    
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [CoordinatorProtocol]()
    
    var type: CoordinatorType { .app }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }

    func start() {
        showLoginFlow()
    }
    func showLoginFlow() {
        // Implementation of Login FLow
        let loginCoordinator = LoginCoordinator.init(navigationController)
           loginCoordinator.finishDelegate = self
           loginCoordinator.start()
           childCoordinators.append(loginCoordinator)
    }
    
    func showMainFlow() {
        // Implementation Main (Tab bar) FLow
            let tabCoordinator = TabCoordinator.init(navigationController)
            tabCoordinator.finishDelegate = self
            tabCoordinator.start()
            childCoordinators.append(tabCoordinator)
    }
    
}

extension AppCoordinator {
    func didFinish(child: CoordinatorProtocol?) {
        guard let child = child else {
            return
        }
        switch child.type {
        case .login:
            showMainFlow()
        case .tab:
            showLoginFlow()
        case .app:
            break
        }
        child.finish()
    }
}
