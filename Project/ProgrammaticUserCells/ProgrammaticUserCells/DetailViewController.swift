//
//  DetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Michelle Cueva on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var user: User!
    
    lazy var userImage: UIImageView = {
          let image = UIImageView()
          return image
      }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        addConstraints()
        setLabels()
        loadImage()
    }
    
    private func setSubviews() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nameLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(emailLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cellLabel)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(userImage)
    }
    
    private func addConstraints() {
           
        NSLayoutConstraint.activate([
           userImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
           userImage.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
           userImage.widthAnchor.constraint(equalToConstant: 250),
           userImage.heightAnchor.constraint(equalToConstant: 250),
           nameLabel.centerXAnchor.constraint(equalTo: userImage.centerXAnchor),
           nameLabel.centerXAnchor.constraint(equalTo: userImage.centerXAnchor),
           nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30),
           emailLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
           emailLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
           emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
           cellLabel.centerXAnchor.constraint(equalTo: emailLabel.centerXAnchor),
           cellLabel.centerXAnchor.constraint(equalTo: emailLabel.centerXAnchor),
           cellLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30),
        ])
        
            userImage.contentMode = .scaleAspectFit

    }
    
    private func setLabels() {
        DispatchQueue.main.async {
            self.nameLabel.text = self.user.name.first
            self.emailLabel.text = self.user.email
            self.cellLabel.text = self.user.cell
        }
        
    }
    
    private func loadImage() {
        DispatchQueue.main.async {
            ImageHelper.shared.getImage(urlStr: self.user.picture.large) { (result) in
                DispatchQueue.main.async {
                     switch result {
                                   case .success(let imagefromJSON):
                                       self.userImage.image = imagefromJSON
                                   case .failure(let error):
                                       print(error)
                                   }
                }
            }
        }
    }
}
