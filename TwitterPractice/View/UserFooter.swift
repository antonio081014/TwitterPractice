//
//  UserFooter.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/28/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit

class UserFooter: BaseCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.textColor = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        let whiteBackgroundView = UIView()
        whiteBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        whiteBackgroundView.backgroundColor = .white
        self.addSubview(whiteBackgroundView)
        self.addSubview(self.textLabel)
        
        whiteBackgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        whiteBackgroundView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        whiteBackgroundView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        whiteBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
        
        self.textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        self.textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
    }
}
