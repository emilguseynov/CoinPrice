//
//  CurrencyCell.swift
//  CoinPrice
//
//  Created by Emil Guseynov on 19.01.2023.
//

import UIKit
import Kingfisher

class CurrencyCell: UITableViewCell {
    
    static let reuseId = "currencyCell"
    let iconImageView = UIImageView()
    let nameLabel = UILabel()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageViewSetup()
        nameLabelSetup()
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func constraints() {
        iconImageView.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: bottomAnchor,
                             trailing: nil,
                             padding: .init(top: 4, left: 4, bottom: 4, right: 0))
        
        nameLabel.anchor(top: topAnchor,
                         leading: nil,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor,
                         padding: .init(top: 4, left: 0, bottom: 4, right: 4))
    }
    
    private func iconImageViewSetup() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.kf.indicatorType = .activity
        addSubview(iconImageView)
    }
    
    private func nameLabelSetup() {
        addSubview(nameLabel)
    }
    
    func configure(iconURL: URL?, name: String) {
        iconImageView.kf.setImage(with: iconURL)
        nameLabel.text = name
    }
}
