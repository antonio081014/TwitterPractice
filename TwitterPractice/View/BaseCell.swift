//
//  BaseCell.swift
//  TwitterPractice
//
//  Created by Antonio081014 on 8/28/17.
//  Copyright © 2017 Antonio081014.com. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    func setupViews() {
        self.addSubview(self.dividerLineView)
        
        self.dividerLineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.dividerLineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.dividerLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.dividerLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}
