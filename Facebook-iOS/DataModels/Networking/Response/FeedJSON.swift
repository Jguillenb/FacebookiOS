//
//  FeedJSON.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 09/02/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let feed = try Feed(json)

import Foundation



    // MARK: - Feed
struct Feed: Codable {
        let feed: FeedClass
        let id: String
    }

    // MARK: - FeedClass
struct FeedClass: Codable {
        let data: [Post]
        let paging: Paging
    }

    // MARK: - Datum
    struct Post: Codable {
        let createdTime: Date
        let id: String
        let message: Message?
    }

    enum Message: Codable {
        case gerardoLeonBarrios
        case juanPabloChavez
    }

    // MARK: - Paging
    struct Paging: Codable {
        let previous, next: String
    }


