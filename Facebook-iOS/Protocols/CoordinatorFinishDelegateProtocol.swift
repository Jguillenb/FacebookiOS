//
//  FinishDelegateProtocol.swift
//  Facebook-iOS
//
//  Created by Jorge Guillén on 16/12/22.
//

import Foundation

protocol CoordinatorFinishDelegate: AnyObject {
    func didFinish(child: CoordinatorProtocol?)
}
