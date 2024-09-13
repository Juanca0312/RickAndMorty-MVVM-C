//
//  HomeFactory.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import UIKit

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImpl: HomeFactory {
    func makeModule() -> UIViewController {
        let homeMenuController = HomeMenuController()
        homeMenuController.title = "Rick and Morty App"
        return homeMenuController
    }
}
