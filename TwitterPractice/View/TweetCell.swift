//
//  TweetCell.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/31/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit

class TweetCell: BaseCell {
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = .white
        self.dividerLineView.isHidden = false
        
        self.addSubview(self.profileImageView)
        
        self.profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        self.profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        self.profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
