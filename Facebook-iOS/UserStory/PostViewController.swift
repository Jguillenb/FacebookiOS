//
//  PostViewController.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 18/01/23.
//

import FacebookAEM
import FacebookCore
import FacebookLogin
import FacebookShare
import Foundation
import PhotosUI
import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var didSendEventClosure: ((PostViewController.Event) -> Void)?
    var postView = PostView()
    var feedView = FeedView()
    var contentView: UIView!

    var profileService = MyProfileNetworkService()
        
    func getUserProfie(accessToken: AccessToken) {
        profileService.getProfileData { result in
            switch result {
            case .success(_):
                print("success")
            case .failure(_):
                print("")
            }
        }
    }
    
    deinit { print("profileViewController deinit") }

    override func loadView() {
        postView.setUpImageButton(self, action: #selector(addImage), for: .touchUpInside)
        postView.setUpPostButton(self, action: #selector(makePost), for: .touchUpInside)
        postView.setUpCloseButton(self, action: #selector(closePost), for: .touchUpInside)
        view = postView
    }
    
    @objc
    func addImage() {
        if #available(iOS 14, *) {
            var config = PHPickerConfiguration(photoLibrary: .shared())
            config.selectionLimit = 1
            let vc = PHPickerViewController(configuration: config)
//            vc.delegate = self
            present(vc, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
    @objc
    func makePost(info: [UIImagePickerController.InfoKey: Any]) {
        
        let content = ShareMediaContent()
        let button = FBShareButton()
//        let photo = SharePhoto(...)
        guard let image = info[.originalImage] as? UIImage else {
                // handle and return
                return
            }
            let photo = SharePhoto(
                image: image,
                isUserGenerated: true
            )
            // use the content
        let video: ShareVideo

            if #available(iOS 11, *) {
                guard let videoAsset = info[.phAsset] as? PHAsset else {
                    return
                }
                video = ShareVideo(videoAsset: videoAsset)
            } else {
                guard let url = info[.referenceURL] as? URL else {
                    return
                }
                video = ShareVideo(videoURL: url)
            }
//        var video = ShareVideo(...)
        button.shareContent = content
        content.media = [photo, video]
    }
    
    @objc
    func closePost() {
//        var body: some PostView {
//            NavigationView {
//                Text("Sheet")
//                    .toolbar {
//                        Button("Close") {
//                            dismiss(animated: false)
//                        }
//                    }
//            }
//        }
    }
    func deviceHasCamara() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func requestCamaraAceess() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            self.requestCamaraAceess()
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.requestCamaraAceess()
                }
            }
        case .restricted:
            return
        case .denied:
            return
        @unknown default:
            return
        }
    
    func requestPhotoLibraryAccess() {
        if #available(iOS 14, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { [unowned self] status in
                DispatchQueue.main.async { [unowned self] in
                    showUI(for: status)
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    func presentImagePicker(at viewController: UIViewController, imagesSource: UIImagePickerController.SourceType) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        var newImage: UIImage

        if let possibleImage = info[.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[.originalImage] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }

        print(newImage.size)

        dismiss(animated: true)
    }
       
        func showLimitedAccess() {
            let photoCount = PHAsset.fetchAssets(with: nil).count
            print("Status: limited\nPhotos: \(photoCount)")
        }
        
        func showUI(for status: PHAuthorizationStatus) {
            switch status {
            case .authorized:
                print("Status: denied")
            case .notDetermined:
                break
            case .restricted:
                print("Status: Restricted")
            case .denied:
                print("Status: Denied")
            case .limited:
                showLimitedAccess()
            @unknown default:
                break
            }

}

}
}

extension PostViewController {
    public enum Event {
    case post
    }
}

extension PostViewController: PostViewModelDelegate {
    func getReference() -> PostViewController {
        return self
    }
}
