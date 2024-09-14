//
//  ItemHomeMenuViewModel.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import Foundation

struct ItemHomeMenuViewModel {
    private let menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var title: String {
        menuItem.title.capitalized
    }
    
    var imageName: String {
        menuItem.title
    }
    
}
