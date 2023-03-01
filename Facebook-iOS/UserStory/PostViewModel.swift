//
//  File.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 18/01/23.
//

import FBSDKCoreKit
import Foundation
import Photos
import PhotosUI
import UIKit
import UITextView_Placeholder

class PostView: UIView, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        createPostTag(with: self)
        addPostButton(with: self)
        addCloseButton(with: self)
        profilePicPost(with: self)
        textBoxPost(with: self)
        imageButtonLayout(with: self)
        addImageButton(with: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createPostTag(with parent: UIView) {
        let tag = UILabel()
        parent.addSubview(tag)
        tag.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
        parent.backgroundColor = .systemBackground
        tag.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tag.font = UIFont(name: "Roboto-Bold", size: 14)
        
        tag.text = "Create Post"
        tag.translatesAutoresizingMaskIntoConstraints = false
        tag.widthAnchor.constraint(equalToConstant: 140).isActive = true
        tag.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tag.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 153).isActive = true
        tag.topAnchor.constraint(equalTo: parent.topAnchor, constant: 44).isActive = true
    }
    
    func profilePicPost(with parent: UIView) {
        let profileImageView = UILabel()
        parent.addSubview(profileImageView)
        profileImageView.frame = CGRect(x: 0, y: 0, width: 76.5, height: 71.5)
        let image0 = UIImage(named: "(insertImage)")?.cgImage
        let layer0 = CALayer()
        layer0.contents = image0
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.62, b: 0, c: 0, d: 1, tx: -0.31, ty: 0))
        layer0.bounds = profileImageView.bounds
        layer0.position = profileImageView.center
        profileImageView.layer.addSublayer(layer0)
        profileImageView.layer.cornerRadius = 10
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.widthAnchor.constraint(equalToConstant: 76.5).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 71.5).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 7.5).isActive = true
        profileImageView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 88.5).isActive = true
    }
    
    func textBoxPost(with parent: UIView) {
        let texBoxView = UITextView()
        parent.addSubview(texBoxView)
        texBoxView.frame = CGRect(x: 0, y: 0, width: 362, height: 232)
        texBoxView.layer.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 0.5).cgColor
        texBoxView.layer.cornerRadius = 10
        texBoxView.font = UIFont(name: "Roboto-Regular", size: 16)
        texBoxView.placeholder = "What's on yout mind"
        texBoxView.placeholderColor = UIColor.lightGray
        texBoxView.translatesAutoresizingMaskIntoConstraints = false
        texBoxView.widthAnchor.constraint(equalToConstant: 362).isActive = true
        texBoxView.heightAnchor.constraint(equalToConstant: 232).isActive = true
        texBoxView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 13).isActive = true
        texBoxView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 140).isActive = true
        
    }
    
    // MARK: fix
    func addImageButton(with parent: UIView) {
        parent.addSubview(imageButton)
        parent.bringSubviewToFront(imageButton)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        imageButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 395).isActive = true
    }
    
    func addPostButton(with parent: UIView) {
        parent.addSubview(postButton)
        parent.bringSubviewToFront(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        postButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 339).isActive = true
        postButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 48).isActive = true
    }
    
    func addCloseButton(with parent: UIView) {
        parent.addSubview(closeButton)
        parent.bringSubviewToFront(closeButton)
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 295).isActive = true
        closeButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 421).isActive = true
    }
    
    func imageButtonLayout(with parent: UIView) {
        let box = UILabel()
        parent.addSubview(box)
        box.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        box.backgroundColor = .gray
//        box.layer.backgroundColor = CGColor
        box.layer.cornerRadius = 10
        box.translatesAutoresizingMaskIntoConstraints = false
        box.widthAnchor.constraint(equalToConstant: 90).isActive = true
        box.heightAnchor.constraint(equalToConstant: 90).isActive = true
        box.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        box.topAnchor.constraint(equalTo: parent.topAnchor, constant: 395).isActive = true
    }
    
    lazy var imageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Img_box_duotone_line"), for: .normal)
        button.imageView?.contentMode = .center
        button.backgroundColor = .white
        button.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        return button
    }()
    
    lazy var postButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Post", for: .normal)
        button.imageView?.contentMode = .center
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.sizeToFit()
        return button
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "closePost"), for: .normal)
        button.imageView?.contentMode = .center
        button.backgroundColor = .systemBackground
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        return button
    }()
    
    func setUpImageButton(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        imageButton.addTarget(target, action: action, for: controlEvents)
    }
    func setUpPostButton(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        postButton.addTarget(target, action: action, for: controlEvents)
    }
    func setUpCloseButton(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        closeButton.addTarget(target, action: action, for: controlEvents)
    }
    
}
