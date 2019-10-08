//
//  UserTableViewCell.swift
//  ProgrammaticUserCells
//
//  Created by Michelle Cueva on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(nameLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureConstraints() {
           nameLabel.translatesAutoresizingMaskIntoConstraints = false
           nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
           
           nameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
       }

}
