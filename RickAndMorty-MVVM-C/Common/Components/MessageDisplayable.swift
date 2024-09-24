//
//  MessageDisplayable.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 24/09/24.
//

import UIKit

protocol MessageDisplayable { }

extension MessageDisplayable where Self: UIViewController {
    func presentAlert(message: String, title: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
