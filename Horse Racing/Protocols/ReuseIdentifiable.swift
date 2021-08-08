//
//  ReuseIdentifiable.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import Foundation

protocol ReuseIdentifiable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
