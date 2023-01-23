//
//  Coordinator.swift
//  CoinPrice
//
//  Created by Emil Guseynov on 19.01.2023.
//

import Foundation
import UIKit

enum Event {
    case rowSelected
}

protocol Coordinator {
    var navController: UINavigationController? {get set}
    
    func eventOccurued(with type: Event, currencyName: String)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

