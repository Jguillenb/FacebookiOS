//
//  FeedViewModel.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 30/11/22.
//

import FBSDKCoreKit
import Foundation
import UIKit
class FeedView: UIView {
    
    var feedInfo = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        feedLogo(with: self)
        feedStroke(with: self)
        tableViewSetup(with: self)
//        tableView.backgroundColor = .blue
    }
        required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FeedViewCell.self, forCellReuseIdentifier: FeedViewCell.reuseIdentifier)
    return tableView
    
}()
    
    func tableViewSetup(with parent: UIView) {
        parent.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 85).isActive = true
        tableView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 85).isActive = true
        tableView.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true

    }
    func setUpTableViewDelegate(delegate: UITableViewDelegate?) {
        tableView.delegate = delegate
        
    }
    
    func feedLogo(with parent: UIView) {
        let logo = UIImage(named: "FacebookFeedLogo")
        let logoView = UIImageView(image: logo)
        parent.addSubview(logoView)
//        logoView.frame = CGRect(x: 0, y: 0, width: 91, height: 23)
        logoView.translatesAutoresizingMaskIntoConstraints = false
//        logoView.widthAnchor.constraint(equalToConstant: 91).isActive = true
//        logoView.heightAnchor.constraint(equalToConstant: 23).isActive = true
//        logoView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 144).isActive = true
        logoView.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        logoView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 54).isActive = true
    }
    func feedStroke(with parent: UIView) {
        let view = UILabel()
        parent.addSubview(view)
        view.frame = CGRect(x: 0, y: 0, width: 390, height: 0)
        let stroke = UIView()
        stroke.bounds = view.bounds.insetBy(dx: -0.25, dy: -0.25)
        stroke.center = view.center
        view.addSubview(stroke)
        view.bounds = view.bounds.insetBy(dx: -0.25, dy: -0.25)
        stroke.layer.borderWidth = 0.5
        stroke.layer.borderColor = UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 390).isActive = true
        view.heightAnchor.constraint(equalToConstant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 85).isActive = true
        
    }
    func configureFeed(feed: FeedClass) {
        return
    }
}

extension FeedView {
    enum Event {
        case feed
    }
}
