//
//  TweetCell.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/31/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit

class TweetCell: BaseCell {
    
    var tweet: Tweet? {
        didSet {
            guard let tweet = tweet else { return }
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)])
            attributedText.append(NSAttributedString(string: "  \(tweet.user.username)\n", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15), NSAttributedStringKey.foregroundColor : UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            attributedText.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: NSMakeRange(0, attributedText.string.characters.count))
            
            attributedText.append(NSAttributedString.init(string: "\(tweet.message)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)]))
            
            self.messageTextView.attributedText = attributedText
        }
    }
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "SOME SAMPLE TEXT"
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
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
        self.addSubview(self.messageTextView)
        
        self.profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        self.profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        self.profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.messageTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        self.messageTextView.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor, constant: 4).isActive = true
        self.messageTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.messageTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
}
