//
//  DetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Kevin Natera on 10/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var user : User!
        
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 100, width: 300, height: 40)
        label.backgroundColor = .white
        label.textColor = .black
        return label
    }()
    
    lazy var addressLabel: UILabel = {
           let label = UILabel()
           label.frame = CGRect(x: 70, y: 200, width: 300, height: 80)
           label.backgroundColor = .white
           label.numberOfLines = 2
           label.textColor = .black
           return label
       }()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        view.addSubview(addressLabel)
        nameLabel.text = user.name.fullName
        addressLabel.text = user.location.fullAddress
        view.backgroundColor = .white
    }
    

 

}
