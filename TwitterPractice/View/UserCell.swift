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
        label.backgroundColor = .green
        return label
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("Follow", for: .normal)
        return button
    }()
    
    func setupViews() {
        self.backgroundColor = .yellow
        self.addSubview(self.profileImageView)
//        self.addSubview(self.titleLabel)
//        self.addSubview(self.followButton)
        
        self.profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        self.profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        self.profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        self.titleLabel.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
