//
//  UserCell.swift
//  ProgrammaticUserCells
//
//  Created by Liubov Kaper  on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class UserCell: UICollectionViewCell {
    
    func configureCell(user: User) {
        userImage.getImage(with: user.picture.large) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error fetching image \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.userImage.image = image
                }
            }
        }
        userNameLabel.text = "\(user.name.first) \(user.name.last)"
    }
//
    public lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.fill")
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.text = "TEST"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      commonInit()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      commonInit()
    }
    
    private func commonInit() {
     setUpImageViewConstraints()
        setUpNameLabelConstraunts()
    }
    
    private func setUpImageViewConstraints() {
        addSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: topAnchor),
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            userImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            userImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func setUpNameLabelConstraunts() {
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           // userNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
    }
}
