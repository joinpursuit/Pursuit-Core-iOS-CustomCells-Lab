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
    
    var userImage: UIImageView = {
          let image = UIImageView()
          return image
      }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    var cellLabel: UILabel = {
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
    }
    
    private func addConstraints() {
           
           NSLayoutConstraint.activate([
               userImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
               userImage.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
              nameLabel.centerXAnchor.constraint(equalTo: userImage.centerXAnchor),
              nameLabel.centerXAnchor.constraint(equalTo: userImage.centerXAnchor),
              nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30)
           ])
    }
    
    private func setLabels() {
        nameLabel.text = user.name.first
    }
    
    private func loadImage() {
        ImageHelper.shared.getImage(urlStr: user.picture.large) { (result) in
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
