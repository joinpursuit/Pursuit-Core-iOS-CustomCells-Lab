//
//  DetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Bienbenido Angeles on 2/3/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = UserView()
    var passedUserObj: User?
    
    override func loadView() {
        super.loadView()
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        
        guard let validUser = passedUserObj else {
            fatalError("failed to get a user passed here")
        }
        detailView.userImageView.getImage(with: validUser.picture.large) {[weak self] (result) in
            switch result{
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Failed to get a image", message: "\(appError)")
                    self?.detailView.userImageView.image = UIImage(systemName: "user")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailView.userImageView.image = image
                }
            }
        }
    }
    

}
