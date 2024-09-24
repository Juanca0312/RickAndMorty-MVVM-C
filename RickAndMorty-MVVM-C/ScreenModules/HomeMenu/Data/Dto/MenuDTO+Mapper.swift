//
//  MenuDTO+Mapper.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 24/09/24.
//

import Foundation

extension MenuDTO {
    func toDomain() -> [MenuItem] {
        return self.dictionatyProperties().map { dictionary in
            let title = dictionary.key
            let url: String = dictionary.value as? String ?? String()
            return MenuItem(title: title, url: url)
        }
    }
}
