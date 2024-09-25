//
//  StateController.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import Foundation

enum StateController {
    case success
    case loading
    case failure(error: String)
}
