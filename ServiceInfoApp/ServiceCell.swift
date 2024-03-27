//
//  ServiceCell.swift
//  ServiceInfoApp
//
//  Created by Ильяс Жанаев on 26.03.2024.
//

import UIKit

class ServiceCell: UITableViewCell {
    
    let serviceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let serviceNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let serviceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(serviceImageView)
        addSubview(serviceNameLabel)
        addSubview(serviceDescriptionLabel)
        
        NSLayoutConstraint.activate([
            serviceImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            serviceImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            serviceImageView.widthAnchor.constraint(equalToConstant: 60),
            serviceImageView.heightAnchor.constraint(equalToConstant: 60),
            
            serviceNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            serviceNameLabel.leadingAnchor.constraint(equalTo: serviceImageView.trailingAnchor, constant: 16),
            serviceNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            serviceDescriptionLabel.topAnchor.constraint(equalTo: serviceNameLabel.bottomAnchor, constant: 8),
            serviceDescriptionLabel.leadingAnchor.constraint(equalTo: serviceImageView.trailingAnchor, constant: 16),
            serviceDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),
            serviceDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let identifier = "ServiceCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        serviceImageView.image = nil
        serviceNameLabel.text = nil
        serviceDescriptionLabel.text = nil
        accessoryType = .none
    }
}

