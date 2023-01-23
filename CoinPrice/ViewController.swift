//
//  ViewController.swift
//  CoinPrice
//
//  Created by Emil Guseynov on 17.01.2023.
//

import UIKit

final class ViewController: UIViewController, Coordinating {
    
    // MARK: - Properties
    var coordinator: Coordinator?
    private let tableView = UITableView()
    
    private var currencies = [Currency]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.reuseId)
        
        Service.shared.fetchCurrencyList { array, _ in
            guard let array = array  else { return }
            self.currencies = array
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        
        }
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        
    }
    
}

// MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.reuseId) as? CurrencyCell {
            let url = URL(string: currencies[indexPath.item].url)
            let name = currencies[indexPath.item].assetId
            cell.configure(iconURL: url, name: name)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        coordinator?.eventOccurued(
            with: .rowSelected,
            currencyName: currencies[indexPath.item].assetId)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
