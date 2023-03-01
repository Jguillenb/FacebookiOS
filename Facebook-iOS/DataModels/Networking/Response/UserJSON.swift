//
//  UserJSON.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 01/12/22.
//
import FacebookCore
import FBSDKCoreKit
import Foundation
// quicktype
// MARK: - UserProfile
struct UserProfile: Codable {
    let id, name: String
    let picture: Picture
}

// MARK: - Picture
struct Picture: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let height: Int
    let isSilhouette: Bool
    let url: String
    let width: Int
}
