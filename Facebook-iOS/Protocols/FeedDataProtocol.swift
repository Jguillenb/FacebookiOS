//
//  feedData.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 11/01/23.
//
import FBSDKCoreKit
import Foundation

protocol FeedDataProtocol {
    func getFeedData(handler: @escaping((Result<Feed, CostumeFeedError>) -> Void))
    func showProgress()
    
}
