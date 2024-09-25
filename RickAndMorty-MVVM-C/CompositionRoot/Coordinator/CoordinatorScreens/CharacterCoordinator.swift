//
//  CharacterCoordinator.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 25/09/24.
//

import UIKit

final class CharacterCoordinator: Coordinator {
    var navigation: UINavigationController
    private let charactersFactory: CharactersFactory
    
    init(navigation: UINavigationController, charactersFactory: CharactersFactory) {
        self.navigation = navigation
        self.charactersFactory = charactersFactory
    }
    
    func start() {
        let controller = charactersFactory.makeModule(coordinator: self)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension CharacterCoordinator: CharacterViewControllerCoordinator {
    func didSelectMenuCell(urlDetail: String) {
        print("to detail")
    }
}
