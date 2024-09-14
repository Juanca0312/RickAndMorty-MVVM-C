//
//  MenuRepositoryImpl.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import Foundation

struct MenuRepositoryImpl: MenuRepository {
    func fetchMenuData() async throws -> [MenuItem] {
        [MenuItem(title: "locations", url: "nada")]
    }
    
}
