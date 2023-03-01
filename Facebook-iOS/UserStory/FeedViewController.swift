//
//  ReadyViewController.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 28/11/22.
//
import FacebookCore
import Foundation
import SwiftUI
import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    var didSendEventClosure: ((FeedViewController.Event) -> Void)?
    var feedView = FeedView()
    var feedService = FeedDataService()
    
    func getUserFeed(accessToken: AccessToken) {
        feedService.getFeedData { [weak self] result in
            switch result {
            case .success(let data):
                let feedData = data.feed
                self?.feedView.configureFeed(feed: feedData)

            case .failure(let error):
                print("Error: \(error)")
            }
        }
        self.updateViewConstraints()
        self.refreshControl.endRefreshing()
//        self.activityIndicatorView.stopAnimating()
    }
    
    override func loadView() {
//        contentView = feedView.containerView
        view = feedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        feedService.getFeedData { result in }
//        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedViewCell else {
            return UITableViewCell()
        }
//        cell.moded = data[indexPath.row]
        return cell
    }
    
//    private var data = [FeedClass.data]()
    
    
    
    let refreshControl = UIRefreshControl()
    
//    private let tableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .grouped)
//        tableView.register(UITableViewCell.self,
//                           forCellReuseIdentifier: "cell")
//        return tableView
//    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//        tableView.backgroundColor = .purple
        }
    
    deinit { print("ReadyViewController deinit") }
    
    @objc private
    func didTapFeedButton(_ sender: Any) {
        didSendEventClosure?(.feed)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
//        if position > tableView.contentSize.height - 100 {
//            print("fecth more")
//    }
}
}

extension FeedViewController {
    enum Event {
        case feed
    }
}
