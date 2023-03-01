//
//  CreatePostCoordinator.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 18/01/23.
//

import FBSDKCoreKit
import Foundation
import UIKit

protocol CreatePostCoordinator: CoordinatorProtocol {
    func showCreatePostView()
}

class PostCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    
    var type: CoordinatorType = .tab
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
       showPostViewController()
    }
    deinit {
        print("Post Coordinator deinit")
    }
    func showPostViewController() {
        let postVC: PostViewController = .init()

        postVC.didSendEventClosure = { [weak self] _ in
            self?.finishDelegate?.didFinish(child: self)
        }
        navigationController.pushViewController(postVC, animated: true)
    }
}
