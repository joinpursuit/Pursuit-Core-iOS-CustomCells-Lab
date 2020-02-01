//
//  UserView.swift
//  ProgrammaticUserCells
//
//  Created by Liubov Kaper  on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class UserView: UIView {

    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 400, height: 200)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemOrange
        return cv
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
       setUpCollectionViewConstraints()
     }
    
    private func setUpCollectionViewConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
