//
//  progressProtocol.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 23/11/22.
//
import FacebookCore
import Foundation

protocol ProgressShowable {

   func showProgress(_ title: String?)

   func hideProgress(completion: Void?)

}
