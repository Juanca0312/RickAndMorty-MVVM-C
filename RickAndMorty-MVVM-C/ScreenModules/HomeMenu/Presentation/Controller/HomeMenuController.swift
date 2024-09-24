//
//  HomeMenuController.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import UIKit
import Combine

final class HomeMenuController: UICollectionViewController {
    
    private let viewModel: HomeMenuViewModel
    private var cancellable = Set<AnyCancellable>()
    
    init(viewModel: HomeMenuViewModel, layout: UICollectionViewFlowLayout) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        stateController()
        viewModel.viewDidLoad()
    }
    
    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                self?.hideSpinner()
                switch state {
                case .success:
                    self?.collectionView.reloadData()
                case .loading:
                    self?.showSpinner()
                case .failure(let error):
                    self?.presentAlert(message: error, title: "Error")
                }
            }.store(in: &cancellable)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupCollectionView() {
        collectionView.register(ItemHomeMenuCell.self, forCellWithReuseIdentifier: ItemHomeMenuCell.reuseIdentifier)
    }
    
    
}


extension HomeMenuController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.menuItemCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemHomeMenuCell.reuseIdentifier, for: indexPath) as? ItemHomeMenuCell else {
            return UICollectionViewCell()
        }
        cell.configData(viewModel: viewModel.getItemMenuViewModel(indexPath: indexPath))
        return cell
    }
}

extension HomeMenuController: SpinnerDisplayable {}

extension HomeMenuController: MessageDisplayable {}
