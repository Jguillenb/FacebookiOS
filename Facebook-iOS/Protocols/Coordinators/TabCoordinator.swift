//
//  TabCoordinator.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 28/11/22.
//

import Foundation
import UIKit

enum TabBarPage {
    case feed
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .feed
        case 1:
            self = .profile
        default:
            return nil
        }
    }
    
    func getIcon() -> UIImage? {
        switch self {
        case .feed:
          return UIImage(named: "feedIconWhite")
        case .profile:
        return UIImage(named: "profileIcon")
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .feed:
            return "feed"
        case .profile:
            return "profile"
        }
    }
    func pageOrderNumber() -> Int {
        switch self {
        case .feed:
            return 0
        case .profile:
            return 1
        }
    }
}

protocol TabCoordinatorProtocol: CoordinatorProtocol {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, CoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController
    
    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [TabBarPage] = [.profile, .feed]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.feed.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        
        // In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(true, animated: false)
        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.getIcon(),
                                                     tag: page.pageOrderNumber())
        
        switch page {
        case .feed:
            let feedVC = FeedViewController()
            feedVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .feed:
                    self?.selectPage(.profile)
                }
            }
            
            navController.pushViewController(feedVC, animated: true)
        case .profile:
            let profileVC = profileViewController()
            profileVC.didSendEventClosure = { [weak self] event in
                                          switch event {
                                          case .profile:
                                              self?.selectPage(.feed)
                                          }
            }
            navController.pushViewController(profileVC, animated: true)
        }
        return navController
        
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate

extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
    }
}
