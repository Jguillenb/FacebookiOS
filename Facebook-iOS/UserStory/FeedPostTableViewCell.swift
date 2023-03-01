//
//  FeedCell.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 13/01/23.
//

import Foundation
import SDWebImage
import UIKit
import UITextView_Placeholder

final class FeedViewCell: UITableViewCell {
    let nameView = UILabel()
    let profileImageView = UIImageView()
    let postInfo = UITextView()
    let cellText = UITextView()
    let avContent = UIImageView()
    
    static let cellHeight: CGFloat = 0
//    static let reuseIdentifier = "CustomTableViewCell"
    static var reuseIdentifier: String { return String(describing: self) }
//    var moded: Feed.Post?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        cellText(with: self)
        cellPostInfo(with: self)
        cellProfileName(with: self)
        cellProfileImage(with: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:)Has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    func cellProfileName(with parent: UIView) {
        let nameView = UILabel()
        parent.addSubview(nameView)
        nameView.frame = CGRect(x: 0, y: 0, width: 174, height: 32)
        nameView.backgroundColor = .white
        nameView.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        nameView.font = UIFont(name: "Roboto-SemiBoldItalic", size: 14)
        nameView.numberOfLines = 0
        nameView.lineBreakMode = .byWordWrapping
        nameView.text = "Deven Mestry"
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.widthAnchor.constraint(equalToConstant: 174).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        nameView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 87).isActive = true
        nameView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 100).isActive = true
    }
    
    func cellProfileImage(with parent: UIView) {
        let image0 = UIImage(named: "(insertImage)")
        profileImageView.image = image0
        parent.addSubview(profileImageView)
        profileImageView.frame = CGRect(x: 0, y: 0, width: 76.5, height: 71.5)
        profileImageView.layer.cornerRadius = 10
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.widthAnchor.constraint(equalToConstant: 76.5).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 71.5).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 7.5).isActive = true
        profileImageView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 88.5).isActive = true
    }
    
    func cellPostInfo(with parent: UIView) {
        let postInfo = UILabel()
        parent.addSubview(postInfo)
        postInfo.frame = CGRect(x: 0, y: 0, width: 133, height: 13)
        postInfo.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        postInfo.font = UIFont(name: "Roboto-Regular", size: 11)
        postInfo.text = "(insertInfo)"
        postInfo.translatesAutoresizingMaskIntoConstraints = false
        postInfo.widthAnchor.constraint(equalToConstant: 133).isActive = true
        postInfo.heightAnchor.constraint(equalToConstant: 13).isActive = true
        postInfo.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 87).isActive = true
        postInfo.topAnchor.constraint(equalTo: parent.topAnchor, constant: 134).isActive = true
    }
    func cellText(with parent: UIView) {
        let textView = UITextView()
        parent.addSubview(textView)
        textView.frame = CGRect(x: 0, y: 0, width: 71, height: 14)
        textView.text = "(insertText)"
        textView.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        textView.font = UIFont(name: "Roboto-Regular", size: 12)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.widthAnchor.constraint(equalToConstant: 71).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        textView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 21).isActive = true
        textView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 167).isActive = true
    }
   
    func configurePicture(profile: String) {
        let profileURL = URL(string: profile)
        profileImageView.sd_setImage(with: profileURL)
    }
    func configureInfo(name: String, info: String, text: String) {
        postInfo.text = info
        cellText.text = text
        nameView.text = name
    }
    }
