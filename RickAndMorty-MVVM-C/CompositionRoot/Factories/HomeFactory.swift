//
//  HomeFactory.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import UIKit
import Combine

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImpl: HomeFactory {
    func makeModule() -> UIViewController {
        let menuRepository = MenuRepositoryImpl()
        let loadMenuUseCase = LoadMenuUseCaseImpl(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImpl(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuController = HomeMenuController(viewModel: homeMenuViewModel, layout: makeLayout())
        homeMenuController.title = "Rick and Morty App"
        return homeMenuController
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (UIScreen.main.bounds.width - 20) / 2
        let layoutHeight = (UIScreen.main.bounds.width - 20)  / 2
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        return layout
    }
}
