//
//  HomeFactory.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import UIKit
import Combine

protocol HomeFactory {
    func makeModule(coordinator: HomeMenuControllerCoordinator) -> UIViewController
    func makeCharactersCoordinator(
        navigation: UINavigationController,
        urlList: String
    ) -> Coordinator
}

struct HomeFactoryImpl: HomeFactory {
    func makeModule(coordinator: HomeMenuControllerCoordinator) -> UIViewController {
        let apiClientService = ApiClientServiceImpl()
        let menuRepository = MenuRepositoryImpl(apiClientService: apiClientService, urlString: Endpoint.baseUrl)
        let loadMenuUseCase = LoadMenuUseCaseImpl(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImpl(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuController = HomeMenuController(
            viewModel: homeMenuViewModel,
            layout: makeLayout(),
            coordinator: coordinator
        )
        homeMenuController.title = AppLocalized.appName
        return homeMenuController
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (ViewValues.widthScreen - ViewValues.doublePadding) / 2
        let layoutHeight = (ViewValues.widthScreen - ViewValues.doublePadding)  / 2
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(
            top: .zero,
            left: ViewValues.normalPadding,
            bottom: .zero,
            right: ViewValues.normalPadding
        )
        return layout
    }
    
    func makeCharactersCoordinator(
        navigation: UINavigationController,
        urlList: String
    ) -> Coordinator {
        let charactersFactory = CharactersFactoryImpl()
        let characterCoordinator = CharacterCoordinator(navigation: navigation, charactersFactory: charactersFactory)
        return characterCoordinator
    }
}
