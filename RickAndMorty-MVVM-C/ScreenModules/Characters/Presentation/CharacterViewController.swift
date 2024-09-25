//
//  CharacterViewController.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 25/09/24.
//

import UIKit

protocol CharacterViewControllerCoordinator {
    func didSelectMenuCell(urlDetail: String)
}

final class CharacterViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
