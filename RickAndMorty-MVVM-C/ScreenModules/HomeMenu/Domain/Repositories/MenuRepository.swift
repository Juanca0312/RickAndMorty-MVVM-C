//
//  MenuRepository.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import Foundation

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuItem]
}
