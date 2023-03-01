//
//  ViewController.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 14/11/22.
//
import FacebookLogin
import Foundation
import UIKit

final class MyViewController: UIViewController {

    private let contentView = MyViewControllerView()

    // MARK: - Life cycle

    override func loadView() {

       view = contentView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
    }

}

// MARK: - MyViewControllerViewDelegate

extension MyViewController: MyViewControllerViewDelegate {

}

// View controller content view class - example:

protocol MyViewControllerViewDelegate: AnyObject {

}

final class MyViewControllerView: UIView {

    weak var delegate: MyViewControllerViewDelegate?
    
    private let testView: UIView = UIView()

    // MARK: - Life cycle

    override init(frame: CGRect) {

        super.init(frame: frame)

        setupLayout()

    }

    required init?(coder: NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }

    // MARK: - Private

    private func setupLayout() {

       addSubview(testView)

       testView.backgroundColor = UIColor.red

       testView.translatesAutoresizingMaskIntoConstraints = false

       NSLayoutConstraint.activate([

           testView.topAnchor.constraint(equalTo: topAnchor),

           testView.bottomAnchor.constraint(equalTo: bottomAnchor),

           testView.leadingAnchor.constraint(equalTo: leadingAnchor),

           testView.trailingAnchor.constraint(equalTo: trailingAnchor)

       ])

    }
    
}
