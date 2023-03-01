//
//  MyProfileNetworkService.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 02/12/22.
//
import FacebookLogin
import Foundation

class MyProfileNetworkService: MyProfileNetworkServiceProtocol {
    enum userDataError: Error, LocalizedError {
            case failedDataEncoding
            case failedDataDecoding
        case failedRequest(errortype: Error)
            case unexpected(code: Int)
            case failedDataFetch
        
    }
    private let path = "me"
    private let parameters = "id,name,picture"
    func getProfileData(handler: @escaping((Result<UserProfile, userDataError>) -> Void )) {
        basicRequest(for: path, with: parameters, handler: handler)
    }
    
    private func basicRequest(for path: String, with parameters: String? = nil, handler: @escaping ((Result<UserProfile, userDataError>) -> Void)) {
        let request = GraphRequest(graphPath: "me", parameters: ["fields": "id,name,picture"])
            request.start { _, result, error in
                guard let result = result, error == nil else {
                    if let error = error {
                        handler(.failure(.failedRequest(errortype: error)))
                    } else {
                        handler(.failure(.failedDataFetch))
                    }
                    return
                }
                guard let encodedData = try? JSONSerialization.data(
                    withJSONObject: result,
                    options: [.sortedKeys]) else {
                    handler(.failure(.failedDataEncoding))
                    return
                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                guard let decodedData = try? decoder.decode(
                    UserProfile.self,
                    from: encodedData) else {
                    handler(.failure(.failedDataDecoding))
                    return
                }
                handler(.success(decodedData))
            }
        
    }
//    func getUserProfile() async {
//
//        let connection = GraphRequestConnection()
//        await connection.add(GraphRequest(graphPath: "/me", parameters:["fields" : "firstName, lastName, id, about"], accessToken: AccessToken.current)) {
//            response, result,  in
//            switch result{
//        case .success(let respone):
//            print("Logged in user faceboko id == \(response)")
//            break
//        case .failed(let error):
//            print("Error gathering user data ==\(error.localizedDescription)")
//            }
//        }
//
//    }
    
        func getUserProfile() {
            guard AccessToken.current != nil else { return }

            let request = GraphRequest(graphPath: "me", parameters: [:])
            request.start { _, result, error in
                if let result = result, error == nil {
                    print("fetched user: \(result)")
                }
            }
}
}
