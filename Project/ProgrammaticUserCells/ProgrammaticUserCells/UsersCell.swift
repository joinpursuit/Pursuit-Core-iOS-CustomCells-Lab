//
//  UserCellCollectionViewCell.swift
//  ProgrammaticUserCells
//
//  Created by Yuliia Engman on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class UsersCell: UICollectionViewCell {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    public func configureCell(for user: User) {
        userNameLabel.text = user.name.first + " " + user.name.last
    }
    
}
