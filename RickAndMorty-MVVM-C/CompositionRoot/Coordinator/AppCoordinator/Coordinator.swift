//
//  Coordinator.swift
//  RickAndMorty-MVVM-C
//
//  Created by Juan Carlos Hernandez Castillo on 13/09/24.
//

import UIKit

/// A protocol that defines the structure for managing navigation flows in an application.
///
/// Coordinators are responsible for handling navigation, ensuring that view controllers
/// are not burdened with this logic, leading to cleaner, more modular code.
protocol Coordinator {
    
    /// The `UINavigationController` that the coordinator manages.
    var navigation: UINavigationController { get }
    
    /// Starts the navigation flow.
    ///
    /// This method sets up and presents the initial view controller for the coordinator.
    func start()
}
