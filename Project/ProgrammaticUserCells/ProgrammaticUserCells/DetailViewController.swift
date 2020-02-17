//
//  DetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Yuliia Engman on 2/16/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class DetailViewController: UIViewController {
    
    public var user: User?
    
    private let detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "User's Details"
        updateUI()
    }
    
    func updateUI() {
        guard let currentUser = user else {
            fatalError("could not load adat for user")
        }
        detailView.nameLabel.text = currentUser.name.title + ". " + currentUser.name.first + " " + currentUser.name.last
        
        detailView.ageLabel.text = "Age: \(String(currentUser.dob.age))"
        
        detailView.address1Label.text = "Address:  \(String(currentUser.location.street.number)), \(currentUser.location.street.name)"
        
        detailView.address2Label.text = currentUser.location.city + ", " + currentUser.location.state + ", " + currentUser.location.postcode
        
        detailView.emailLabel.text = "Email: \(currentUser.email)"
    }
}



