//
//  ApiClientService.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 23/09/24.
//

import Foundation

protocol ApiClientService {
    func request<T: Decodable> (url: URL?, type: T.Type) async throws -> T
}
