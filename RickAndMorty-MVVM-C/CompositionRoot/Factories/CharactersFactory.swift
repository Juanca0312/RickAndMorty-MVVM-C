//
//  CharactersFactory.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 25/09/24.
//

import UIKit

protocol CharactersFactory {
    func makeModule(coordinator: CharacterViewControllerCoordinator) -> UIViewController
}

struct CharactersFactoryImpl: CharactersFactory {
    func makeModule(coordinator: any CharacterViewControllerCoordinator) -> UIViewController {
        let controller = CharacterViewController()
        controller.title = "Characters"
        return controller
    }
    
    
}
