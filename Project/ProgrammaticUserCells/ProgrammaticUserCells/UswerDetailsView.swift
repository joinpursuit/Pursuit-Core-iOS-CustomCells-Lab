//
//  UswerDetailsView.swift
//  ProgrammaticUserCells
//
//  Created by Liubov Kaper  on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class UswerDetailsView: UIView {

   var user: User?
    public lazy var userImage: UIImageView = {
         
       let image = UIImageView()
//        image.getImage(with: user?.picture.large ?? "image") { [weak self] (result) in
//            switch result {
//            case .failure(let appError):
//                print("error fetching image \(appError)")
//            case .success(let image):
//                DispatchQueue.main.async {
//                    self?.userImage.image = image
//                }
//            }
//        }
    return image
    }()
    
    public lazy var nameLabel: UILabel = {
        let nLabel = UILabel()
        nLabel.textAlignment = .center
        nLabel.numberOfLines = 0
        nLabel.backgroundColor = .systemPink
        //nLabel.text = "\(user?.name.first ?? "") \(user?.name.last ?? "")"
        return nLabel
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
      setUpImageviewConstraints()
        setUpLabelConstraints()
    }
    
    private func setUpImageviewConstraints() {
        addSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            userImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            userImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            userImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])
    }
    
    private func setUpLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        ])
    }
}
