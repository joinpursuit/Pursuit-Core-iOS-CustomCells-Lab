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
        userImage.contentMode = .scaleAspectFill
        return userImage
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        //FIXME: add title, name + surname
        label.text = ""
        return label
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        //FIXME: add address
        label.text = ""
        return label
    }()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        //FIXME: add email from API
        label.text = ""
        return label
    }()
    
    public lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        //FIXME: add userName from API
        label.text = ""
        return label
    }()
    
    public lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    //FIXME: add password from API
    label.text = ""
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
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor), imageView.heightAnchor.constraint(equalTo: heightAnchor, constraint: 100)
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
          addSubview(addressLabel)
          addressLabel.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
          ])
      }

    private func setupEmailLabelConstraints() {
           addSubview(emailLabel)
           emailLabel.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
           ])
       }
    
    private func setupUsernameLabelConstraints() {
            addSubview(usernameLabel)
            usernameLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                usernameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
                usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            ])
        }
    
    private func setupPasswordLabelConstraints() {
            addSubview(passwordLabel)
            passwordLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                passwordLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20),
                passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                passwordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            ])
        }
}
