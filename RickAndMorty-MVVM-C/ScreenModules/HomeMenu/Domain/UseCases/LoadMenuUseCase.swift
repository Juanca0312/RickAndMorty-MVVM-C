//
//  LoadMenuUseCase.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import Foundation

protocol LoadMenuUseCase {
    func execute() async -> Result<[MenuItem], Error>
}

struct LoadMenuUseCaseImpl: LoadMenuUseCase {
    let menuRepository: MenuRepository
    
    func execute() async -> Result<[MenuItem], Error> {
        do {
            let result = try await menuRepository.fetchMenuData()
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
