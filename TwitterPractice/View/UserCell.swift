//
//  UserCell.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/23/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Test Test Test"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "username"
        label.backgroundColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .yellow
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .cyan
        button.setTitle("Follow", for: .normal)
        return button
    }()
    
    func setupViews() {
        self.addSubview(self.profileImageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)
        self.addSubview(self.bioTextView)
        self.addSubview(self.followButton)
        
        self.profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        self.profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        self.profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.titleLabel.topAnchor.constraint(equalTo: self.profileImageView.topAnchor, constant: 0).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor, constant: 8).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.followButton.leftAnchor, constant: -8).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8).isActive = true
        self.subtitleLabel.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor, constant: 0).isActive = true
        self.subtitleLabel.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: 0).isActive = true
        self.subtitleLabel.heightAnchor.constraint(equalTo: self.titleLabel.heightAnchor, constant: 0).isActive = true
        
        self.bioTextView.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 0).isActive = true
        self.bioTextView.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor, constant: 0).isActive = true
        self.bioTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.bioTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        self.followButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        self.followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        self.followButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.followButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
