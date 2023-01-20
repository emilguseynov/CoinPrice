//
//  MainCoordinator.swift
//  CoinPrice
//
//  Created by Emil Guseynov on 19.01.2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navController: UINavigationController?
        
    func eventOccurued(with type: Event, currencyName: String) {
        if type == .rowSelected {
            let exchangeVC = ExchangeViewController()
            exchangeVC.title = currencyName
            navController?.pushViewController(exchangeVC, animated: true)
        }
    }
    
    func start() {
        let viewController = ViewController()
        viewController.coordinator = self
        navController?.setViewControllers([viewController], animated: false)
    }
}
