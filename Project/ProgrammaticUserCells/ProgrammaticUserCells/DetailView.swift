//
//  DetailView.swift
//  ProgrammaticUserCells
//
//  Created by Yuliia Engman on 2/16/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
//FIXME: load ImageKit
//import ImageKit

class DetailView: UIView {
    
    public lazy var imageView: UIImageView = {
        let userImage = UIImageView()
        userImage.image = UIImage(systemName: "photo")
        userImage.contentMode = .scaleAspectFit
        return userImage
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        //FIXME: add title, name + surname
        label.text = "nameLabel"
        label.backgroundColor = .white
        return label
    }()
    
    public lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        //FIXME: add address
        label.text = "ageLabel"
        label.backgroundColor = .white
        return label
    }()
    
    public lazy var address1Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        //FIXME: add email from API
        label.text = "address1Label"
        label.backgroundColor = .white
        return label
    }()
    
    public lazy var address2Label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        //FIXME: add userName from API
        label.text = "address2Label"
        label.backgroundColor = .white
        return label
    }()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        //FIXME: add password from API
        label.text = "emailLabel"
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupImageViewConstraints()
        setupNameLabelConstraints()
        setupAddressLabelConstraints()
        setupEmailLabelConstraints()
        setupUsernameLabelConstraints()
        setupPasswordLabelConstraints()
    }
    
    private func setupImageViewConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor), imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setupAddressLabelConstraints() {
        addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            ageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            ageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setupEmailLabelConstraints() {
        addSubview(address1Label)
        address1Label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            address1Label.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            address1Label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            address1Label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setupUsernameLabelConstraints() {
        addSubview(address2Label)
        address2Label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            address2Label.topAnchor.constraint(equalTo: address1Label.bottomAnchor, constant: 20),
            address2Label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            address2Label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func setupPasswordLabelConstraints() {
        addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: address2Label.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}
