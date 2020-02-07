//
//  CustomTableViewCell.swift
//  ProgrammaticUserCells
//
//  Created by Ahad Islam on 2/7/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class CustomTableViewCell: UICollectionViewCell {
    
    let images = [UIImage(systemName: "person.circle.fill") , UIImage(systemName: "person.circle")]
    
    
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
//        iv.contentMode = .center
//        iv.clipsToBounds = true
//        iv.layer.cornerRadius = 50
//        iv.layer.borderWidth = 5
//        iv.layer.borderColor = UIColor.black.cgColor
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.text = "OK"
        l.textAlignment = .center
        return l
    }()
    
    private lazy var cellLabel: UILabel = {
        let l = UILabel()
        l.text = "OKOKOK"
        l.textAlignment = .center
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .systemPink
        setupImageView()
        setupNameLabel()
        setupCellLabel()
                
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureView(_ user: User) {
        imageView.image = images.randomElement() ?? UIImage(systemName: "heart.fill")
        
        imageView.image = UIImage(systemName: "person.circle")
        nameLabel.text = user.name.first + " " + user.name.last
        cellLabel.text = user.cell
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo:safeAreaLayoutGuide.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo:safeAreaLayoutGuide.trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)])
        imageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }
    
    private func setupCellLabel() {
        addSubview(cellLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }
    

}
