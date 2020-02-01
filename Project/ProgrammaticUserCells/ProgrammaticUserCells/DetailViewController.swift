//
//  DetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Liubov Kaper  on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    private let detailView = UswerDetailsView()
    
   public var user: User?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       updateUI()
    }
    
    func updateUI() {
        guard let userInfo = user else {
            fatalError("")
        }
        detailView.userImage.getImage(with: userInfo.picture.large) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error fetching image \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailView.userImage.image = image
                }
            }
        }
        detailView.nameLabel.text = " Email: \(userInfo.email) \n\(userInfo.gender) \nPhone Number:\(userInfo.phone)"

}
}
