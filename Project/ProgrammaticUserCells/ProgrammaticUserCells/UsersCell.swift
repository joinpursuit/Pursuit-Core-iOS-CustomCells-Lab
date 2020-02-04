//
//  UsersCell.swift
//  ProgrammaticUserCells
//
//  Created by Bienbenido Angeles on 2/3/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class UsersCell: UICollectionViewCell {

    //let cellView = UserCellView()
    
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "headline", size: label.font.pointSize)
        return label
    }()
    public lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont(name: "subtitle", size: label.font.pointSize)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)// need a new frame
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        setUpImageViewConstrainsts()
        setUpTitleLabelConstrainsts()
        setUpSubtitleLabelConstraints()
    }
    
    func setUpImageViewConstrainsts(){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
        ])
    }
    
    func setUpTitleLabelConstrainsts(){
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
        ])
    }
    
    func setUpSubtitleLabelConstraints(){
        addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
    }
    
    func configureCell(for user: User){
        imageView.getImage(with: user.picture.thumbnail) { (result) in
            switch result{
            case .failure:
                self.imageView.image = UIImage(systemName: "user")
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
        titleLabel.text = user.name.title + " " + user.name.first + " " + user.name.last
        subtitleLabel.text = "Cell: \(user.cell)"
    }
    

}
