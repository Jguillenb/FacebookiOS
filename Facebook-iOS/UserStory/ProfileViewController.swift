//
//  ProfileViewController.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 28/11/22.
//
import FacebookAEM
import FacebookCore
import FacebookLogin
import Foundation
import PhotosUI
import UIKit

class profileViewController: UIViewController, UISheetPresentationControllerDelegate {

    var didSendEventClosure: ((profileViewController.Event) -> Void)?
    var profileView = ProfileView()
//    var contentView: UIView!
    
    var profileService = MyProfileNetworkService()
        
    func getUserProfie() {
        profileService.getProfileData {[weak self] result in
            switch result {
                
            case .success(let data):
                let fullName = data.name
                let profilePic = data.picture.data.url
                self?.profileView.configurePictures(profile: profilePic, header: "")
                self?.profileView.configureText(bio: "", name: fullName)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    override func loadView() {
        profileView.setUpAddPostAction(self, action: #selector(addPost), for: .touchUpInside )
        profileView.setUpLogOutAction(self, action: #selector(logOut), for: .touchUpInside )

        view = profileView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserProfie()
    }
    
    deinit { print("profileViewController deinit") }

    @objc private
    func didTapProfileButton(_ sender: Any) {
        didSendEventClosure?(.profile)
    }
    
    @objc
    func addPost() {
        let postViewController = PostViewController()
        postViewController.view.backgroundColor = .systemBackground

        if #available(iOS 15.0, *) {
            if let sheet = postViewController.sheetPresentationController {
                sheet.detents = [.large()]
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.prefersEdgeAttachedInCompactHeight = true
                sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true

            }
            sheetPresentationController?.delegate = self
            sheetPresentationController?.selectedDetentIdentifier = .medium
            sheetPresentationController?.prefersGrabberVisible = true
            sheetPresentationController?.detents = [
                .medium(), .large()
            ]

        } else {
            // Fallback on earlier versions
        }
    self.present(postViewController, animated: true, completion: nil)
    print("addpost")
    }
    
    @objc
    func logOut() {
        let logout = LoginManager()
                logout.logOut()
                print("logout")
    }
}

extension profileViewController {
    enum Event {
        case profile
    }
     
}
