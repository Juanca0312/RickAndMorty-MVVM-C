//
//  MenuRepositoryImpl.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import Foundation

struct MenuRepositoryImpl: MenuRepository {
    
    let apiClientService: ApiClientService
    let urlString: String
    
    func fetchMenuData() async throws -> [MenuItem] {
        let url = URL(string: urlString)
        return try await apiClientService.request(url: url, type: MenuDTO.self).toDomain()
    }
    
}
