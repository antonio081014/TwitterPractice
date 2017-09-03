//
//  UserCell.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/23/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit

class UserCell: BaseCell {
    
    var user: User? {
        didSet {
            guard let user = user else { return }
            self.titleLabel.text = user.name
            self.subtitleLabel.text = user.username
            self.bioTextView.text = user.bio
            self.profileImageView.loadingImageUsingUrlString(urlString: user.profileImageUrl)
        }
    }
    
    let profileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Brian Voong"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "@buildthatapp"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!"
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear
        textView.isEditable = false
        return textView
    }()
    
    let followButton: UIButton = {
        let twitterBlue = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1)
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(twitterBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = .white
        self.addSubview(self.profileImageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)
        self.addSubview(self.bioTextView)
        self.addSubview(self.followButton)
        
        self.dividerLineView.isHidden = false
        
        self.profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        self.profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        self.profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.titleLabel.topAnchor.constraint(equalTo: self.profileImageView.topAnchor, constant: 0).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor, constant: 8).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.followButton.leftAnchor, constant: -8).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 0).isActive = true
        self.subtitleLabel.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor, constant: 0).isActive = true
        self.subtitleLabel.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: 0).isActive = true
        self.subtitleLabel.heightAnchor.constraint(equalTo: self.titleLabel.heightAnchor, constant: 0).isActive = true
        
        self.bioTextView.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: -4).isActive = true
        self.bioTextView.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor, constant: -4).isActive = true
        self.bioTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.bioTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        self.followButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        self.followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        self.followButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.followButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
}
