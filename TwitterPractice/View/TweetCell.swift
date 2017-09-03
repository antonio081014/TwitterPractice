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
        tv.isEditable = false
        tv.text = "SOME SAMPLE TEXT"
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let profileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        self.setupBottomButtons()
    }
    
    fileprivate func setupBottomButtons() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        let replyView = UIView()
        replyView.addSubview(self.replyButton)
        replyButton.topAnchor.constraint(equalTo: replyView.topAnchor, constant: 0).isActive = true
        replyButton.leftAnchor.constraint(equalTo: replyView.leftAnchor, constant: 0).isActive = true
        replyButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        replyButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let retweetView = UIView()
        retweetView.addSubview(self.retweetButton)
        retweetButton.topAnchor.constraint(equalTo: retweetView.topAnchor, constant: 0).isActive = true
        retweetButton.leftAnchor.constraint(equalTo: retweetView.leftAnchor, constant: 0).isActive = true
        retweetButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        retweetButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let likeView = UIView()
        likeView.addSubview(self.likeButton)
        likeButton.topAnchor.constraint(equalTo: likeView.topAnchor, constant: 0).isActive = true
        likeButton.leftAnchor.constraint(equalTo: likeView.leftAnchor, constant: 0).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let directMessageView = UIView()
        directMessageView.addSubview(self.directMessageButton)
        directMessageButton.topAnchor.constraint(equalTo: directMessageView.topAnchor, constant: 0).isActive = true
        directMessageButton.leftAnchor.constraint(equalTo: directMessageView.leftAnchor, constant: 0).isActive = true
        directMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        directMessageButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        stackView.addArrangedSubview(replyView)
        stackView.addArrangedSubview(retweetView)
        stackView.addArrangedSubview(likeView)
        stackView.addArrangedSubview(directMessageView)
        
        stackView.topAnchor.constraint(equalTo: self.messageTextView.bottomAnchor, constant: 0).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor, constant: 4).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
