//
//  SignInViewModelProtocol.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 16/11/22.
//

import Foundation

protocol SignInViewProtocol {
    var loadingIndicator: String { get }
    func onAuthDidSucceed()
    func onAuthDidFail()
}
