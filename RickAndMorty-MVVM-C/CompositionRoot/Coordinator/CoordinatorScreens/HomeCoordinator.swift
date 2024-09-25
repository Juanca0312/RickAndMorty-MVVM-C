//
//  HomeCoordinator.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let homeFactory: HomeFactory
    
    init(navigation: UINavigationController, homeFactory: HomeFactory) {
        self.navigation = navigation
        self.homeFactory = homeFactory
    }
    
    func start() {
        let controller = homeFactory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension HomeCoordinator: HomeMenuControllerCoordinator {
    func didSelectMenuCell(model: MenuItem) {
        switch model.title {
        case "characters":
            goToCharacters(urlList: model.url)
        case "episodes":
            goToEpisodes()
        case "locations":
            goToLocations()
        default:
            break
        }
    }
    
    private func goToCharacters(urlList: String) {
        let coordinator = homeFactory.makeCharactersCoordinator(
            navigation: navigation,
            urlList: urlList
        )
        coordinator.start()
    }
    
    private func goToLocations() {
        print("Locations screen")
    }
    
    private func goToEpisodes() {
        print("Episodes screen")
    }
    
}
