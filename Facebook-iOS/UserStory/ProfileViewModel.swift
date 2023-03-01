//
//  ProfileViewModel.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 30/11/22.
//
import FacebookCore
import FBSDKCoreKit
import FBSDKLoginKit
import Foundation
import SDWebImage
import UIKit
import UITextView_Placeholder

class ProfileView: UIView {
    
    var profileName = UILabel()
    var profileBio = UITextView()
    var profilePicture = UIImageView()
    var profileHeader = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupBody(with: self)
        setupHeader(with: self)
        setupProfilePic(with: self)
        addButtons(with: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // profile pic
    private func setupProfilePic(with parent: UIView) {
        let imageContent = UIImage(named: "stockPP")
//        let profilePic = UIImageView(image: imageContent)
        profilePicture.image = imageContent
        parent.addSubview(profilePicture)
        profilePicture.frame = CGRect(x: 0, y: 0, width: 225, height: 274.82)
        profilePicture.layer.masksToBounds = true
        profilePicture.layer.cornerRadius = 25
//        profilePicture.layer.borderWidth = 5
        profilePicture.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.widthAnchor.constraint(equalToConstant: 170).isActive = true
        profilePicture.heightAnchor.constraint(equalToConstant: 170).isActive = true
        profilePicture.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 110).isActive = true
        profilePicture.topAnchor.constraint(equalTo: parent.topAnchor, constant: 175).isActive = true
        
        let ppFrame = UILabel()
        parent.addSubview(ppFrame)
        ppFrame.frame = CGRect(x: 0, y: 0, width: 180, height: 180)
        ppFrame.backgroundColor = .white
        ppFrame.layer.masksToBounds = true
        ppFrame.layer.cornerRadius = 25
        ppFrame.translatesAutoresizingMaskIntoConstraints = false
        ppFrame.widthAnchor.constraint(equalToConstant: 180).isActive = true
        ppFrame.heightAnchor.constraint(equalToConstant: 180).isActive = true
        ppFrame.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 105).isActive = true
        ppFrame.topAnchor.constraint(equalTo: parent.topAnchor, constant: 170).isActive = true
        parent.bringSubviewToFront(ppFrame)
        parent.bringSubviewToFront(profilePicture)
    }
    
    // header
    private func setupHeader(with parent: UIView) {
        let imageContent = UIImage(named: "stockHeader")
//        let header = UIImageView(image: imageContent)
        profileHeader.image = imageContent
        parent.addSubview(profileHeader)
        profileHeader.frame = CGRect(x: 0, y: 0, width: 390, height: 250)
        profileHeader.backgroundColor = .black
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        profileHeader.widthAnchor.constraint(equalToConstant: 390).isActive = true
        profileHeader.heightAnchor.constraint(equalToConstant: 250).isActive = true
        profileHeader.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
        profileHeader.topAnchor.constraint(equalTo: parent.topAnchor, constant: 40).isActive = true
    }
    
    func setupBody(with parent: UIView) {
        parent.backgroundColor = .systemBackground
        
//        let profileName = UILabel()
        parent.addSubview(profileName)
        profileName.frame = CGRect(x: 0, y: 0, width: 288, height: 26)
        profileName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        profileName.font = UIFont(name: "Roboto-Regular", size: 26)
        profileName.font = UIFont.boldSystemFont(ofSize: 26)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        // TODO: implement text from user data name
//        profileName.text = MyProfileNetworkService.getProfileData("first_name")
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.widthAnchor.constraint(equalToConstant: 288).isActive = true
        profileName.heightAnchor.constraint(equalToConstant: 26).isActive = true
        profileName.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 27).isActive = true
        profileName.topAnchor.constraint(equalTo: parent.topAnchor, constant: 365).isActive = true
        
//        let profileBio = UITextView()
        parent.addSubview(profileBio)
        profileBio.frame = CGRect(x: 0, y: 0, width: 343, height: 56)
        profileBio.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        profileBio.font = UIFont(name: "Roboto-Regular", size: 14)
//        profileBio.numberOfLines = 0
//        profileBio.lineBreakMode = .byWordWrapping
        // TODO: implement text from user data bio
        profileBio.text = "About text bla bla bla. Link to my web-site:  https://www.youtube.com/ (up to 200 symbols)."
        profileBio.isEditable = false
        profileBio.isScrollEnabled = false
        profileBio.dataDetectorTypes = [.all]
        profileBio.translatesAutoresizingMaskIntoConstraints = false
        profileBio.widthAnchor.constraint(equalToConstant: 343).isActive = true
        profileBio.heightAnchor.constraint(equalToConstant: 56).isActive = true
        profileBio.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 29).isActive = true
        profileBio.topAnchor.constraint(equalTo: parent.topAnchor, constant: 402).isActive = true
    
    }
    
    func addButtons(with parent: UIView) {
        parent.addSubview(logOutButton)
        parent.addSubview(addPostButton)
        parent.bringSubviewToFront(logOutButton)
        parent.bringSubviewToFront(addPostButton)
        addPostButton.translatesAutoresizingMaskIntoConstraints = false
        addPostButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addPostButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        addPostButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 22).isActive = true
        addPostButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 75).isActive = true
        
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.widthAnchor.constraint(equalToConstant: 67).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        logOutButton.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -22).isActive = true
        logOutButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 75).isActive = true
    }
    
    // return button
    lazy var logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "logOutButton"), for: .normal)
        button.imageView?.contentMode = .center
        button.tintColor = .white
//        button.backgroundColor = .white
        button.frame = CGRect(x: 0, y: 0, width: 16.5, height: 15.5)
        return button
    }()
    
    lazy var addPostButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Add post", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.imageView?.contentMode = .center
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 26)
        return button
    }()
    
    func setUpAddPostAction(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        addPostButton.addTarget(target, action: action, for: controlEvents)
    }
    func setUpLogOutAction(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        logOutButton.addTarget(target, action: action, for: controlEvents)
    }
    
    func configurePictures(profile: String, header: String) {
//        profilePicture.image = profile
//        profileHeader.image = header
        let profileURL = URL(string: profile)
        let headerURL = URL(string: header)
        profilePicture.sd_setImage(with: profileURL)
        profileHeader.sd_setImage(with: headerURL)
    }
    
    func configureText(bio: String, name: String) {
        profileBio.text = bio
        profileName.text = name
    }
}
 
