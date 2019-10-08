//
//  UserCollectionViewCell.swift
//  ProgrammaticUserCells
//
//  Created by Michelle Cueva on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    var nameLabel: UILabel = {
           let label = UILabel()
           return label
       }()
    
    var userImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureConstraints()
    }
        required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(userImage)
    }
    
    private func configureConstraints() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
           userImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
           userImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
               
           nameLabel.centerXAnchor.constraint(equalTo: userImage.centerXAnchor),
           nameLabel.centerXAnchor.constraint(equalTo: userImage.centerXAnchor),
           nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30)
        ])
    }
    
}
