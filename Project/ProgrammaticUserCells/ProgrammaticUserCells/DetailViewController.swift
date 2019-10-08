//
//  DetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Michelle Cueva on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
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
           
//           NSLayoutConstraint.activate([
//               greenModeSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//               greenModeSwitch.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//                  
//              statusLabel.centerXAnchor.constraint(equalTo: greenModeSwitch.centerXAnchor),
//              statusLabel.centerXAnchor.constraint(equalTo: greenModeSwitch.centerXAnchor),
//              statusLabel.topAnchor.constraint(equalTo: greenModeSwitch.bottomAnchor, constant: 30)
//           ])
          
       }
}
