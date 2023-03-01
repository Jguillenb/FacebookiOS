//
//  PostDelegate.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 25/01/23.
//

import Foundation

protocol PostViewModelDelegate: AnyObject {
    func getReference() -> PostViewController
}
