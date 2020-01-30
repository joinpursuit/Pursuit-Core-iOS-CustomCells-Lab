//
//  UserCell.swift
//  ProgrammaticUserCells
//
//  Created by Liubov Kaper  on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
//
    public lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.fill")
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    public lazy var userName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
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
}
