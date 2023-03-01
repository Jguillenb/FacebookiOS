//
//  KeychainProtocol.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 30/11/22.
//

import Foundation

protocol KeychainProtocol {
    
    static func saveInfo(password: Data, service: String, account: String) throws
    
    static func update(password: Data, service: String, account: String) throws
    
    static func readPassword(service: String, account: String) throws -> Data
    
    static func deletePassword(service: String, account: String) throws
    
}
