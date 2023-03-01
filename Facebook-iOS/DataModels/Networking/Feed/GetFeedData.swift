//
//  GetFeedData.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 12/01/23.
//

import FBSDKCoreKit
import Foundation

class FeedDataService: FeedDataProtocol {
    private let path = "me/feed"
    private let parameteres = "id,message,created_time,attachments,from,place,privacy"
    func getFeedData(handler: @escaping((Result<Feed, CostumeFeedError>) -> Void )) {
        getFeedData(for: path, with: parameteres, handler: handler)
    }
    
    private func getFeedData(pagination: Bool = false, for path: String, with parameters: String? = nil, handler: @escaping((Result<Feed, CostumeFeedError>) -> Void)) {
//        let connection = GraphRequestConnection()
        var request: GraphRequest
        if let parameters = parameters {
            request = GraphRequest(graphPath: path, parameters: ["fields": parameters])
        } else {
            request = GraphRequest(graphPath: path)
        }
        request.start { _, result, error in
            guard let result = result, error == nil else {
                if let error = error {
                    handler(.failure(.failedRequest))
                } else {
                    handler(.failure(.failedRequest))
                }
                return
            }
            guard let encodedData = try? JSONSerialization.data(withJSONObject: result, options: [.sortedKeys])
            else {
                handler(.failure(.failedDataEncoding))
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .iso8601
            guard let decodeData = try? decoder.decode(Feed.self, from: encodedData) else {
                handler(.failure(.failedDataDecoding))
                return
            }
            handler(.success(decodeData))
        }
    }
    func showProgress() {
        // 
    }
    
}
enum CostumeFeedError: Error {
    case failedGetData
    case failedRequest
    case failedDataEncoding
    case failedDataDecoding
    
}
