//
//  UserViewController.swift
//  ProgrammaticUserCells
//
//  Created by Bienbenido Angeles on 2/3/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class UserView: UIView {
    public lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var userLocationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var userContactLabel: UILabel = {
        let label = UILabel()
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit(){
        setUpUserImageViewConstrainsts()
        setUpUserNameConstrainsts()
        setUpUserLocationConstrainsts()
    }
    
    private func setUpUserImageViewConstrainsts(){
        addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            userImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            userImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8)
        ])
    }
    
    private func setUpUserNameConstrainsts(){
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8),
            userNameLabel.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor)
        ])
    }
    private func setUpUserLocationConstrainsts(){
        addSubview(userLocationLabel)
        userLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLocationLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            userLocationLabel.leadingAnchor.constraint(equalTo: userLocationLabel.leadingAnchor),
            userLocationLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor)
        ])
    }
    
    private func setUpContactLabel(){
        addSubview(userContactLabel)
        userContactLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userContactLabel.topAnchor.constraint(equalTo: userLocationLabel.bottomAnchor, constant: 8),
            userContactLabel.leadingAnchor.constraint(equalTo: userLocationLabel.leadingAnchor),
            userContactLabel.trailingAnchor.constraint(equalTo: userLocationLabel.trailingAnchor)
        ])
    }

}
