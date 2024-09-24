//
//  PropertyIterator.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 24/09/24.
//

import Foundation

protocol PropertyIterator {}

extension PropertyIterator {
    func dictionatyProperties() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary : [String: Any] = [:]
        mirror.children.forEach { property in
            dictionary[property.label ?? String()] = property.value
        }
        
        return dictionary
    }
}
