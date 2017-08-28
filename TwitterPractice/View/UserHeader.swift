//
//  UserHeader.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/28/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit
class UserHeader: BaseCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        self.addSubview(self.textLabel)
        
        self.textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        self.textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}
